Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795313461;
	b=xFweUqhDRohCB/2GMV97kS6sJzLeoVlQp3VvuqEPZwophWXuN3FfYY3D5RFsYVJfSXFE
	 rGqGImLL2vI2szcIhS30N6mhoYzVfxqYrdqfx5Lx4O5fMv2Sw4aL7M9C+wOUI81ZUJsxR
	 PEc6uafPDwuyvK9E3D0ezwLyQDArBj7RImXOxGooTsTBsFz2zuvSXEHqo1OBVUehL723f
	 LGtU3RH2+FroBMQ7n3kbnbb0gUudYlBolbLZbtSNEEUKGO+HPoFjeqlTStkIZvr5Qb03K
	 oMC+xV8N6pyv18rgeZPv1+PGJZZu4O2yWHBVG3yxKYAVQmQ6RQOWvZBHdixzk91IB6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795313461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fjSZBrDKFgyY2dEkYo0GGe61uPH3KjDpFZp1Qf75waQ=;
	b=x035x35wnL/Z4Bb8tJX3PZ7wbAi21XsaOSEgtVvsq/z+LuSWHDgMEXQgouwKaDwV2ZDW
	 mQUj5Zw8R8InceeOR8lmLgK16hQ4V0ZQu7M38MEItoOOfa8CGY6nE5rT7umnNl/ZGIWYK
	 Q4YI8eO5w9A6bykBr/sqi/N6SST56y5WL7UxMMKNDfTb4nuQOQfqnLtRxrrAdhmx439DG
	 BNMTlDRe2qXST47oBFFaP1X57PFSI86neER2inAMBJxCY+RaW2C/8RP0jHLtP/G32XkMe
	 diPImGEhNI9uwMXocbzTDJVCcBonVjtuLLCX8v/DJ08RknVoUAVfnQ5fVT9dIEZelfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSQqYG1r;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDD3606A320
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDD3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DSQqYG1r
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1411643f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 18:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795313459; x=1795918259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjSZBrDKFgyY2dEkYo0GGe61uPH3KjDpFZp1Qf75waQ=;
        b=DSQqYG1rbxAROFU0MT6qERZNWUoSmGLWo16vyJbO3EfrPBRy8+u37IGQOBPb70h3uv
         WwMQFip6wXQbEIm/EYKUPmBWkrCQlm6T+X+8olNkN8r0PjGAUqUtcWdkZv7i2PHlLK0W
         UGTkBB1Zi2NlEon8T/qat7J9lsKkk65piAEpRrr+NHa81dCfJcqZNSQ6uxlYThLpahbO
         DEDSl2pKYRA3ux3udXKzRyC7O0vDM5tyHSWYtbEUp+TdDN/MAVw93/vy23WyvxC0Usrb
         qXLXDmyEkn725fmyOSJEcTCZ56AXMhC8CsQH8T8RMPw+3Hrbt/1PKuHq2DX7lK+LDIzl
         LmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795313459; x=1795918259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fjSZBrDKFgyY2dEkYo0GGe61uPH3KjDpFZp1Qf75waQ=;
        b=o+R3UQ5SFzqP0Vjeio9RlgKbhAx4IxSbgCjXPVUAIoGawKGy3OIOTt38XfMql/t2oM
         kPVK89/LtebgPofwJhJbhY5JTAUyKf5h/pka2p7cPDjnQko1EP1wvvZud0hg6VJkOcAt
         epzXwix46jnV1ajN8BJeUGkWpD+xjmMCIUOqjisivWQrhennHJIzFFb96bToQyX3Cy93
         J6TMbuNu79c4obZimboAw7/BD4IQhhbqCs/53Eg+Uvmt1F/WBf1b8igN63t4GaxBt7Q2
         d3vT0syWLqh39IEdUDUNKAa3kb/xxDTberLo+5WY7lyQyiwSMFShYy+2sc9KpZY8Jume
         sQlA==
X-Forwarded-Encrypted: i=1; AL+hErHeZAmID1li75G/dH09gez5WAqHNSJnrXYi7QnmR0aij/fDjklzxb9hMPyc8qw3V+clwXEUUV2DivFbMg2t@vger.kernel.org
X-Gm-Message-State: APuU4Z8UZ6cIjl1a9/z7yysjADBmmYN7WEwCOjjWUTVKSrk+oMoSYCby
	wAJi2CAXo/bRg0Mmda4LCi8xMe+Af8PET2y7Yvi6YqrW1yAyHY5Zi0iSOTbK5f5Yoyk=
X-Gm-Gg: AZFdTZdAatA46qKVVB52Y468JUtB1itlRVivu+KlLDRJWr175XNvkTVcNLGqngwigyZ
	ejCZY8p3K3G9LzLS5wsttAFZDDt2LCo2R0hr5OzTD5EX89GTcLWNUZ4yN6XcGwvbDffNjDZw1Iw
	C5dhik5cRcI5C+KzlQsjXyMoj3EPlHP9fn3jFwfIxMdk/iaRvuPCUG+gOuXwSqCMuGK0YE40jJl
	iUdBIqrFly8V5rnOu0yDgicE9yHV2duZzH6jFew7JMqDG7ZZjvekoB1y9RUtDd1BaGt0kTvim2e
	/Efwfj3n4K0o8DCsih+l2Nkygs1Ir3viO8+5S0YoljvYuG3Rmppycko15BZM3tK27s3tEkA35Af
	BRBU80Od5y3V/CioRazTZhZFqEjuZJ6EvqVo3vJeFWCGF8WlaKdvH1dAJ3VNJrp+Kwa2syxNIGd
	XRPbCOnOSySGSBlZx2VTddy6uG0zpBsuYhK0ziGp1r/wEtSPxL3WWd/NnweojV7vo6hfZ+ckXPi
	f9d+lDrnty02p80jhv3U1K8ubsY2UNlHQ0eGxNhDqG4DXSA2E9rzSR9Rs6r0tP4ztzwktbZKoNP
	nFG4jFVIvizcfNjBLMMtJqE6RUEjV6M5hmR72m2dHw==
X-Received: by 2002:a05:6000:3107:b0:4af:e519:cccc with SMTP id ffacd0b85a97d-4afe519ce74mr4819970f8f.12.1795313459221;
        Sat, 21 Nov 2026 18:10:59 -0800 (PST)
Received: from [127.0.0.1] ([109.76.78.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm14822085f8f.2.2026.11.21.18.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 18:10:58 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sun, 22 Nov 2026 02:10:50 +0000
Subject: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1571; i=bod@kernel.org;
 h=from:subject:message-id; bh=kbhtaYYTdFf8+b92Inmn8UijKqhmvfcr5MYTlK6RLis=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrAk8quDuanOu+l431p0UPeYlzincFEfiMSDQnT
 Xp4YtkDT3SJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawJPKgAKCRAicTuzoY3I
 Ou1DEACrUDvqsMKDkk+SQ/W+21Acy1rn740yOwpLgQS+ygrPqhtjCPASAOiO/QaTN3XWa5GQI3n
 9U0R993MyklBnL+cWuvb5fwS4XhiAi0IvGfe76EVBkNSfaFn6ISonuey+9p6JUvr1d7XSUV+Png
 cJgHpBjtqRmklCHcwlY+OHkMHKtVhnUkVdOnDKmeggPPl4DDecnG8RSrQfnQj99WjLN9L/yk8Zu
 wj32NSk5yGVNIEQvlI+knHxea0Oau6KEAlCIaLw2kRCUFBNouoT7XTA1yJNtvzey+TAbAA75sD4
 c48lP5HA8XUVBzohNaBNEJZkC7/sZ9L7NFWE0u35z3cvoFVsVXgOOcyNjuAYSfJ93TLx9/anjMG
 aNFTQyfGCZC3pqvS/ZAJKN+86z8/XXsrIkM3PunFw1MFS2QmrhW+9qyiCAuRRy7alRo7LVQVgfp
 qUba2o/UI+sDZFHLpAX6oP5/EcdaK6pB2yUyHb2bNlcOUETcExuew7tcYx9p0nhHUCr5ehc8sf9
 Zf9RqvBio1roSCPDZJgE2j1zwuzKKctsiyPXHcf31mwfIePT2UnJsU0KYno6X/W3aUtE71Mcaxu
 jWD+cs3Ulqd6q78FQvlRRZR9HaGDYThbbIjd7z3i3GJV5CJhRkOkKsncnM+sKV21ll/uOdxMmhJ
 CQE8w2h6lcQZoQw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Every time we add a SoC the src_pad_code switch statement is expanded. This
expansion has continued to the point where there are more SoCs listed for
what used to be the exceptional state, than the reverse.

Invert the logic. The exception to the rule is the old SoC set there's no
purpose in expanding this switch continuously.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6..10ad862ff5010 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,21 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	case CAMSS_660:
-	case CAMSS_2290:
-	case CAMSS_6150:
-	case CAMSS_6350:
-	case CAMSS_7280:
-	case CAMSS_8x96:
-	case CAMSS_8250:
-	case CAMSS_8280XP:
-	case CAMSS_8300:
-	case CAMSS_845:
-	case CAMSS_8550:
-	case CAMSS_8650:
-	case CAMSS_8775P:
-	case CAMSS_KAANAPALI:
-	case CAMSS_X1E80100:
+	default:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -415,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 			return sink_code;
 		}
 		break;
-	default:
-		WARN(1, "Unsupported HW version: %x\n",
-		     vfe->camss->res->version);
-		break;
 	}
 	return 0;
 }

-- 
2.56.0

