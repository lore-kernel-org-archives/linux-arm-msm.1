Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190095;
	b=FHSwtEOzSql3Qvo9YG0+UWfjoO848q9WmGo9/AY2xZpGTIBLrXWRKlDmBLFO9pq3Q3MQ
	 wZ7+CdYT3rLWsy/iyi+xze4tbq/SedqGl84K4ian8PbBVwnhepdkdWpKkv1srGeDYViVZ
	 AsswmaT8gxqrUwuYaaCmrCOa+E9uib1mfS1dOJIwYvuIOTkBIBoExYLqVmV2YQEhuFuBs
	 /Vc0biS2Xo7Bqear5DeNSwzZJqNmp3lqJJZkF2ZR+ek4uavfE4zMXv/ao7NJeewcE3lqa
	 ta9IFqzo9DDlU7NjGavT8Feq1OCVSPnfgh64yBQscm3cKYiqsG2lb0fT85T6eZgaOPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=pJJStarHyj+rDcMYVARFLmh3AIOFKT+u7ceZwCuppW0+YvVZlfNre33SxI4nXwu1bf4q
	 9i4nYP75ifJNT9zYyHNBXKxoBfyLH9AY9awZPD6vCH58weaXX0u59i549vTqM4jpl079p
	 VMaIh3tulSVth6ztT+GoDzfcSKqx3Kbb+JnfWayjO8W4T6z5JsfE2kiOObbLVcGrLM+0L
	 vpC0c/ZmBgRjeg3XFygVFA0aVWC7eLyumcDKNZyi5GXxKHl33FpT6xoMcpo5HTr8y6329
	 YxE8KOIPpOdWJ6f3pdy6Rw8ofxpcSk0F4/9aBlI6JdRWZLo0hgkRWCqgRhSnMT9RFug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C7606A339
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB2C7606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C9ymzV1n
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so12830945e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190093; x=1795794893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=C9ymzV1nmJJShkya7UcSKR6iPDN+n6RuxSd56u4zS4owB/0cvJp3RDW67ws+Gmp9Oy
         JxkSDl1mw5dfJV7cYJf1CnuPNq33/dywYRPcs51Z/1PqES9VB53htY2kCtrGZZHijOLx
         teyhPFNnnKYqEPMEQZo5lIg+/YPMVhfYBIqmI3bq4n9ha6d4mIcSse0j+8r3/ZHFpyFr
         WeiAvffXOcPc1haHpB4IMFkmCXmC9Y4WOziIjRLOEMZil0DiqeOpJQF98Br5cMKFdLjB
         bP67IuLd2gKNBPlgGiD1S+FbgLuFU+Bup66zVZR6ib61yBQMSNyG+iFQHkMB8KJy6+j4
         eDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190093; x=1795794893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=ATXz7Kx0m0v+Nyh16VDGOFFCD6XYGYebFb9Hxa+ultwAwutsvkLNAyF/6ZgXvVVlM1
         oqacg4Q90RY/E6J46MOFF0wZ47p5C7CHYJDfLx4Y5zfDT0ioXfDlv/nlKT+m9vojWdM0
         Et/nR7w+YSJXfEdSKdJz9ymDHNzP6bv0Dsjx/pj3E7HpA3MOeoMbmVzKbPHkZR2RT4c8
         h+hhIxjuPh8FQgMELVVw2i6tBzeShM8valIXiZbDUcNmEQ+jRtSCKZAvEQU+innqng4R
         ecR2JdWMDkNA0+YjDoJPMkMRCLmnSJ1KRb/rTZfLESL2eH2Tu7mqGCm/WpB3RiTa2hJV
         0njw==
X-Gm-Message-State: APuU4Z8gqOQjbO7e4vT16KmSNNofV73vNeJOI3D+7ozowYzlh3XTwUAP
	Epc9tnoHJtZZj6jyjNnImbMaS8PDmDHNrY34kou38d/E8Zqofosx+xXltbZe/E728gg=
X-Gm-Gg: AYBFou1f6tSV6qCvdej6DaaC4c5WWd7efRrk3klrEznrJPCctbFLAfE2M37HMs0UeGx
	8DChfwN5MThStdUTYGqwVj0SK51YqvtcRW4ilJzY5hSl7X0j1gjUwwueZLFw6Rd/2Z4HMo1758m
	Bim55ngdhPjsMZlU6onLkNQtzJw+QUCjDgMUEneGNnCvoulLAxqqigWRjJQlMFKD+9gkWvG3KGz
	zIt/SAsPOPMYxxwWsgbgGu+kw64EigvO3jE6DGqvMmREra8eduVJoEhBeOlHFfR6pPdPMs0HTWf
	Kk56fH2ELaV20lLLeYhGaN0/mSFQkAAQ2K4xitkrVzKznLRj2aQu1mhEEKwcVL4MQL09qRO0Xgw
	sTl6I19aLbAHbm3imFIcJ0iHramvWyBkMm6+OpvhFO0B1mD6r3Y/8JPvYDD1+G9WSn3hzsS2j8T
	KUQ0IgYs6JCcLGauDfex/+P416OGa/qUwb8ghePPXQOm+GT4VrblkHuX+Rmm9ePIfM8N43nOQUZ
	/0PxWHewJvcBLwEQZTRMF3pWdx94jYmgMe+kWXp8/BLX7eYmZw/x+wJDC3QSSj4V/M1APBx/PSz
	3yfNBzpVj4Zz/yH+WThI/50SpLUbFT/lt/Rq6MeHnggorPUANJ0UJwCKzoNqSg5nma2xpCmvAwY
	=
X-Received: by 2002:a05:600c:3547:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4bb88809795mr76390745e9.16.1795190093061;
        Fri, 20 Nov 2026 07:54:53 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:52 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Fri, 20 Nov 2026 16:54:40 +0100
Message-Id: <20261120155450.7719-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

