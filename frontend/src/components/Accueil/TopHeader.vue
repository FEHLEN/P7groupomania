<template>
    <div class="head ">
        <v-navigation-drawer
            v-model="drawer"
            color="rgba(9, 31, 67, 0.9)"
            expand-on-hover
            mini-variant
            mini-variant-width=45
            top
            permanent
            absolute
            dark
            class="w-50 menu__header">
            <v-list dense nav class="py-0 ">
                <v-list-item two-line class="px-0 ">
                    <v-list-item-avatar>
                        <v-img src="../../assets/logo-blanc.png" alt="logo blanc icon globe" contain></v-img>
                    </v-list-item-avatar>
                        
                    <v-list-item-content>
                        <v-list-item-title>
                            Groupomania
                        </v-list-item-title>
                        <v-list-item-subtitle>
                            Le réseau
                        </v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-divider></v-divider>
                <v-list-item v-for="item in items" :key="item.title">
                    <v-list-item-icon>
                        <v-icon>{{ item.icon }}</v-icon>
                    </v-list-item-icon>
                    <v-list-item-content>
                        <router-link :to=item.link>
                            <v-list-item-title>{{ item.title }}</v-list-item-title>
                        </router-link>
                    </v-list-item-content>
                </v-list-item>
             
                <v-list-item-icon v-if="this.modo==1">
                    <v-list-item-icon>
                        <v-icon>mdi-cog-outline</v-icon>
                    </v-list-item-icon>
                    <v-list-item-content @click="moderation" class="lien">
                        <v-list-item-title>Modération</v-list-item-title>
                    </v-list-item-content>
                </v-list-item-icon>

                <v-list-item>
                    <v-list-item-icon>
                        <v-icon>mdi-exit-to-app</v-icon>
                    </v-list-item-icon>
                    <v-list-item-content @click="logout" class="lien">
                        <v-list-item-title>Se déconnecter</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </div>
</template>

<script>
export default {
    name : 'TopHeader',
    data(){
        return {
            modo: "",
            drawer: true,
            items: [
                { title: 'Accueil', icon: 'mdi-home-outline', link: '/Accueil'  },
                { title: 'Profil', icon: 'mdi-account-circle', link: '/Accueil/Profil'},
                { title: 'Mur', icon: 'mdi-view-dashboard-outline', link: '/Accueil/Mur' },
                
            ],
        }
    },
    methods: {
        logout(){
            localStorage.userId = "";
            localStorage.token = "";
            localStorage.moderation = "";
             this.$router.push('/');
        },
        moderation(){
            this.$router.push('/Accueil/Moderation')
        }
    },
    mounted(){
        this.modo = localStorage.moderation;
    },
}
</script>

<style lang="scss">
    a {
        text-decoration: none;
        color: rgba(255, 255, 255, 0.9)!important    
    }
    a:hover {
        color: white!important        
    }
    .menu__header{
        position: fixed!important
    }
    .lien{
        cursor: pointer;
    }
</style>