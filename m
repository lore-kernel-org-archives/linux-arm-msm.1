Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606292;
	b=edqcaM/mNYP6N9vrsHkEqIjxF8HAcKoUy6ZQ49H82BlNhRDzsbaEi9zaPXVIdPw47BK1
	 8+B95QKB5ThWoLVBAFgTSpBccDKij3tYkDsdzS2dfaDU76CR7IDzchfhQujBb1yUvzVJH
	 mLMYxi1EtQ1KPQL/6CX3z8T1biUppERSyx2gGBn/v67z2QC54Cmc6w0j+2NxqBmjoqgop
	 /70Xmj9HQCTHWT23oNkh3I8feoaOAj7ppzAjGo+3lIVBq6awMQVIzOlGV8WukPPBPbX06
	 euQIrlCi2O9kf+RjN14SpQm2IdRMqc8cDPZM/9oqzC6vdyLTYNlbjJfDlQu32he4waA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
	b=b9kwUe/soVKT3jtl28VLUAr913ucxKKrJWOe3e80HIzLGQs66j8jX6akJclhxgmEDnev
	 JJNCRk+ebzl//l055WHOYFT2tDMUulk/3w6OtbZ4eTcGf9M+QPMQOkUzITdeQSoQOBAEs
	 lPtAh4AiCsnurLiTEAUlS7+4lSb5Txg2O6tmU0VUx/oXimljydKiAoNlyVh6Xtm5yrvHc
	 DCSbub+334yh4Nb0t/1FAxvWpY9phXNWdOELVm5sR7CphM+SovVk64Cue87us8m7gKzRG
	 YrtKKO6LJMGdYi8dXQdCcyr23lagB32yMf3HmVXDottJSH0EmQgHHYDPvQNxpIuCZJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nhOwUvm/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3144E606A886
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 21:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3144E606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nhOwUvm/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so19473505e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606289; x=1795211089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=nhOwUvm/CbESYpvABc6bNV4x/SqUyA7LVECFI3YGDJDEH0wgu3eha8ut6df2uzN5bw
         o6Nc0gSzp8VX54fSjOyVQDKDWVvSHSHBkbG+EqDg5z6tAnAR3hJYDpe6WYF2PHIJBOzF
         0IL+2SuX6exmoNCwgbQxOKey405yshwiX7lL4A/kmvahqR8mm0pn4YsYlQnSNWDL9x5w
         BixJAAEASN/aPt+VKfmZzBa66+mrG58BGauwdZYjQFQZsCSBjxuOPTOBdxJK4c96Mdnd
         J/sAC9ZChBGA5OQFX6BdJeuEKL+iVapjlX2wXMViNzheJR0P/g8H9W4F0ZNtjvde4TsO
         Y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606289; x=1795211089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VSNciQwXoLzNC38H4Cu8pkuiuhLtNiZHzowcIJLxJLQ=;
        b=wp7P3eIrTOxtzJFhudwUQoyOtMbUxqWb9RAIK8ehg1pHN5tX2AlqMlZX33Cu0GDf+h
         3OimrZYTcaRdUI8HlVtAPksCG+2+Mh/Np9N+bBjT48MZEMEIxobZooJ9G1YbDT+eGIMJ
         yi0rLy2tVwHoRtutD0J23SjISekjtT88662lD7w3DT6xpSrsBbWHs5bxHLMdoXDZpJZg
         H5Ievo0HJ2fU/h84ZFxzGjQwxtiFTNjSU1JkIK8KpVWM9cQIIt3yLjOPPKwcVthJxyKX
         yfnwV+mdiyCh5NgmL767b7o2y1GIOVsrflK0dsgEsdEXkNYlnQO6d19rckULSGcL/EaQ
         gP0A==
X-Gm-Message-State: APuU4Z+RbqHz8igRhpg9uJxMrjTXBK/lryVc/7t9ScBrASVJ0dwvIjwT
	7pa7PaeEFXoOTlZy1KUH8fx3e5/GvnJHSZuvJrPNNV3KRSyN1sNFCvX/
X-Gm-Gg: AYBFou27HngRWYGv13aeUYk2JGh6ALlLYki5LlaXSpCjRTlwN+q2Fo5asi+jWtGBAq5
	yVVlSdPaJsdWDuuRXqFAVwO+Ohpz+sUrVCxDS/CUjOOE7+z+jdJGP5BXXlYMFRwbRWOkiBf3KJy
	Nqkoh5fvcY3GNttqOwA0OxquLxuWIQVWF90lW9MVpLeNdsImUCkmZ00twlLAPMc2jj32ogJDgws
	+15/tvI6B5Bk/K5n1nITAGLpfyytv3bYc02CsMOKr0tFhBmETU35U0jY5mkxFuPZwHAbs7yfBT/
	wo8a5DaPtxZwm/6K1hTT7xVg6ft+MJU+zSNsRx2M4Uyuefx8jSUx6gCS7jpRNdaPsUIZGpkziqf
	w5+0GJ8JARAXqExxkYCL7pqyPWfOzAImI2FKRaLDdksD26jB1RqUi33doxf9k7jkWglLvVkzVDH
	dyZOamkKWGj8V7xR/uYO/daWWie2+/VozHtk48PRA+mMA/L1PtGQ98ctOd2V8ny4OcH4wD7De8W
	NGQyhsV7WDeblnMLLclX0HbucGlNyu/gr1+1L/N3HFKEvSRaD4VKNAPZ1wEaN3KJTg5asek2aXQ
	TZIBVRa19FGDNspEGax/L4nSpTPkvVAi3mxoPBpyJEaGQQ8pq8J3y3cadX+iICn+JUUrSTE=
X-Received: by 2002:a5d:64c9:0:b0:48f:ead0:631a with SMTP id ffacd0b85a97d-49c72ba5d3emr8894959f8f.47.1794606289387;
        Fri, 13 Nov 2026 13:44:49 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c8d286480sm11644595f8f.7.2026.11.13.13.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:44:49 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
Date: Fri, 13 Nov 2026 22:43:40 +0100
Message-ID: <20261113214424.220241-2-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
References: <20261113214424.220241-1-ingo.kubbilun@gmail.com>
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

Document the ASUS Vivobook S 16 S3607QA, a laptop based on the
Snapdragon X X1-26-100 (X1P42100, Purwa).

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..2390568de805 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1350,6 +1350,7 @@ properties:
       - items:
           - enum:
               - asus,vivobook-s15-x1p4
+              - asus,vivobook-s16-s3607qa
               - hp,omnibook-x14-fe1
               - lenovo,thinkbook-16
               - qcom,x1p42100-crd
-- 
2.47.3

