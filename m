Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1406642B756
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874782; cv=none; b=R0Om/wKejiD0NzqvjzKuFGGg3lct/Jd96nx5opL3iHfoEtWkLJK6JtUUZNDjbBPiDK9HHj/2ZkWHv6/DMvsGQyKt6c3PNBZ4TrBXD1GbIx1/gTC7lH+S4pHlIJM0ZkMp7K9bqfcZ3f5EuEfbGZneURX0mOwz5uhINFWckFV14TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874782; c=relaxed/simple;
	bh=/LJeDAuGWK+Vu0IUbOSeylfhGGJ+OywLgyTGhlrPh44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C/lIKXNRgqLNizgcXhG3hMPgNTZtrgC1m72VBp9/fQE/Ad0+xCSrNRZ7wnSIYOnHZra+aeQfHDpc+B/GKe4dMUp5yWek1nPdNHCkygS3EsFcF/dV+kLZiZOY0XpX/AWI1qFA8DTW2lGn4eVhXMUjXwTl8g+yAd8S7LQ/3oh9LBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UiIZEpti; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UiIZEpti"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b01910b499so323339e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874779; x=1786479579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DKWvqwJnN9M8kSu2yW/P7qhGb8fyraad4Xw9GRMaCPI=;
        b=UiIZEptiUKL/imWbUvNnyYebYR76ismFs9SQ1LhIEKmvAKgkQbr1CbfQF54b95m1Do
         fCPnscCo/oYMjxeBtVV3ITYQrufZceBRZC6xq9d5Oyit6rvh0QY4VBdZqBXYjuKcNlYK
         9Iu9UNc9F6uINlPpeEKpkwZM1OMtxA8okTLUk9WVhZSFUAxyKJKyuK3tgDBWiyFuFSCO
         kzaH6c1mgjTp7jnQINtHzCgeaOggV6Cf/4KsfG3MBAhDDsHweSKw1fIXCvTiOXmcPJCs
         1B5kVCG2ubgh0iBcBF+c8LlYNcvqqXlY8/ZsgwhrjsrgsY0ld9y0rWG8PnamxL0C26w7
         Ktlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874779; x=1786479579;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DKWvqwJnN9M8kSu2yW/P7qhGb8fyraad4Xw9GRMaCPI=;
        b=X8A7kAL/QqnKDDfJnFu5xwJ7Gou7NQea/SmgXJefU2/TpT6PSBIKJa9FlyJCkq20L9
         gubWwshJZ8RL+n94G4zpWG24mt3CCTkq6MAGfXuHlk0RwZc0uLKxwO0nzQ5Y32RLkD9+
         mg1QRTgqXMAIqOiuC1KKyKUsqkw39m+GKs/JPVTmdJbflVzsnUi6lykiQxXVr3FbBTgp
         bD0KaILbHn/R7nPLSZI+WeFzUbGTnC1r/KTMTh5O/5eoXZYOr5dTc2urdNPyySwkuZ6D
         Y7FVlFdxj+8Mjo2yH1vAE+nQwBMTE+PHoKCzb5zUHkqMqoZ87nXKQ9gsXHIvXsIBXkoH
         z2Mg==
X-Forwarded-Encrypted: i=1; AHgh+RrW/wKF2bYMrpUBDDa1MC8W+O4xxCPL3crzH7jTMKcOj1UF9YBVRoD9TlS4n/FxSFyFeNxo3XIgA7FDRiem@vger.kernel.org
X-Gm-Message-State: AOJu0YwKC1YhMFA7lSEun2Ud+gOrXCyt9QlFyMLKM15TgVzA0S92OdQ4
	irgypAvYteMSiPtZ9zUkYSgQLRAKXkQE7nNZD3NWg3BgvZs55lpX2A7Q
X-Gm-Gg: AR+sD13B1x4urxEn1XnrlOEBNQzkwjI8936iLa/Pm2NXoIup7dpclOgvFmBm9LdkGIt
	G3C9berv2fW2LPdlnApq16agwGpnR69kCVYfGC8RxP+2i6RTrn574RumES+0aoUZqp5v89ggdFc
	I/j0Xjk50xuZ0nfF1SHMdj9NTgR3gsMBzSWgmPZUoArlof0r5rZ83uQzW0YwA7OA+kIIqcWm4Ma
	faTXrU3LXYL8OA9UjO7/xNry11C8g+C/VGbF3YepTkvIJISdWC2J/Rsw5AVzdDehVYoMMUNFav1
	PwWBqDB2+oRBwtOti+Tk8MJvRNj11Hes791RTqesKWNvJmZ2a44UJaLhAWgrbeoZ3H9SR8bb35x
	2xF8RVWhHFigwmCfA4jfdxrbVhMm3+Q/CWE9ld/z7Jz2jj9+yxeGbXXIDbJoN9EsCYUU4ZBRoP6
	6GR105EP3B/d625gdf0Q2VyAwhmv1RjSS1difP2bg69Ay4csLAoJJ00X4K
X-Received: by 2002:a05:6512:a481:b0:5b1:5f9a:96bf with SMTP id 2adb3069b0e04-5b2f485d30amr177786e87.8.1785874778843;
        Tue, 04 Aug 2026 13:19:38 -0700 (PDT)
Received: from luk-pc.lan ([89.228.17.202])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5b2f62af852sm12661e87.48.2026.08.04.13.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>
To: 
Cc: =?UTF-8?q?=C5=81ukasz=20Patron?= <priv.luk@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: qrtr: ns: Raise lookup limit to 128
Date: Tue,  4 Aug 2026 22:18:30 +0200
Message-ID: <20260804201919.1148015-1-priv.luk@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Current limit of 64 is not enough for Sony Xperia 10 VII (SM6475).

Fixes: 5640227d9a21 ("net: qrtr: ns: Limit the maximum number of lookups")
Signed-off-by: Łukasz Patron <priv.luk@gmail.com>
---
 net/qrtr/ns.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/qrtr/ns.c b/net/qrtr/ns.c
index e5b2adb161d9..c5e7e01db249 100644
--- a/net/qrtr/ns.c
+++ b/net/qrtr/ns.c
@@ -78,7 +78,7 @@ struct qrtr_node {
  */
 #define QRTR_NS_MAX_NODES   512
 #define QRTR_NS_MAX_SERVERS 256
-#define QRTR_NS_MAX_LOOKUPS 64
+#define QRTR_NS_MAX_LOOKUPS 128
 
 static u16 node_count;
 
-- 
2.55.0

