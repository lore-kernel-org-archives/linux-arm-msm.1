Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864319;
	b=ADGEvB7Y4eGwHHODRz5o4sRXGADrImV5uIX7lncFt+unZW3GA5dnxmqPlJutMBCFnt4/
	 uCPhnCaOvj0E9bmmfyF5KjHS+M+JVS1R3rlq6TzH1QRH1qUnT3s+WmJd/bZIuTK5L3qks
	 id/CIJR9gsAJMlF1HHxS/sN9OWI2jMADV310v1OWP3GEJI2bDPg6PxpwBLYmNNfbofynZ
	 CVNf0yLdjVw9JTmQ9J15Oq63BmeMIBBkraQFD0XSieTCWE26jfRVeMBkBkMNvi9SvMMpO
	 j3y0EMSVEkSI+8DoTa28wuxMMs5XERASJgmGWNZK0DICH00MwEepc6CCZhSr2n4yBLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
	b=JTrU7iraSPWAgz7+Cr9LM45sOijLcXLfNJ+n+VCin0CNAzPfROSc9ePt7X8irr2NbPmB
	 nhJ6b2h8JHALRS54Uf+Q6lQpTkI20ltUQr4m4uY97dcZZhKIoVXwqld71z7Q8RHX/2elu
	 oYDBgnUNor3jFxwIbWwab9JGtcNPHBtOaHzp8CWE+DvzxcsVe7ZBi1BmLPONptBGudy5v
	 j1vrgOIRDjGq4SsEcJqQtm++cC++a/NL5yCRPv0pp+ghw1aiQKrhBOHE9cPfygBWNHRnB
	 HjoRWkXHB0K4o9StrTIncQjzRTROK9sQwpBdDxamZu+kqFccyojIG/cL4MUHqQvFxQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOLL8Whu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59DD606A881
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C59DD606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UOLL8Whu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so35086275e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864317; x=1795469117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
        b=UOLL8Whu4LA8bNveYjnlOSE38Ii77baYdefAzKBwlYfl11uUi1Qrf9fMBGpquz3o2e
         vKn3CvN+EumW6pOW5Qn6+es+DJl3mdDy4k2yt3ueX3bbTGxSwZXA3h/2RRnVEUrB4Vvq
         pg7T/CRQIR6huYmF3hi7pPvvAazaohD0VbPSmnldcEEbXZ28dnJFa1HsvVM3Rheb4bOB
         uKvYq8v2IJyU99lrrsvgoB+lmkiGHwqEu/A5wTRI8NLDYOCbsRjCpmlLePXBIpd714go
         U9ADvoXRexU3wQChWFi39Z64trquY2qUbnIlSIIcnmix+ZWryn3+v1c+1a7M9VCBpCHx
         Ozvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864317; x=1795469117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SOARYtnJo18igv291sc1eP7B92CvpPV7r5k9Q4RbGA=;
        b=i/nCbRp9A6uqLC1BRuWqbTss4kmu2ZD5IHlA2+BlR5qih7st7u7wjt7G/5E8ScSS/k
         tdAY5gkOoWqRoR+BoLzh6MXyye8Ib8bvCD1hLHoJ0W4JdKEfugndzGVyR9XPTcTQD6/m
         Bi+YBzPGxgdIASTmnZlHfeVSTOFQ8dcZYyjCba7T9sAwldz9f8WP/51EZqM5hVOiZZbd
         zBDDMlCxdBWzwIZ6PpGwrMAmDo+XFufPhzOs3uJqDnNh6a7p4ItmQeKocn/+qI2oFq4C
         f2ht6eI6cG9UQmfGVryNmJ+TZO9DCX6bp3w8WBo77WoXWiTMcx9vujerv9cg+W1nMreU
         5Hdg==
X-Forwarded-Encrypted: i=1; AL+hErGvGZHzKQ2Ew9zce/tOQ2pzrd3SttzrVWaSRz8VXYk6WIWMuQVzxvg1MjpWtS3/FHzNgVG+S9kqE0apEc2k@vger.kernel.org
X-Gm-Message-State: APuU4Z9oWnHqnNSj7/+a7wrEViOLm/yDPH+YCtOs34ycbfiJKQW0P1e7
	SkrTXO+7nhvVCKf3sA1ue/8zMz+pYBlE9aJhzG/6xiFBghtQpCZ7BQFw
X-Gm-Gg: AYBFou00LQv37YvXLy9XirNobULl6AY7HZh2ca++EC1WUHxCHNiVTEruhG7GZn9JLzg
	tpgA63JWJExG8GhbRBp0YvoTXar36nVK9UyDejNpNRX9liyqhYHYDCodU7CpjG7Kz/GopEa/lOz
	VZNIoKUvaGZJN52hrhrnUZ+z1GeW1Ya87wk2zGQogMG1U5Omqsp4eFDh+/27JzCz7zJ1tGLdp9B
	lIuYrXL86CW5F5fkL3M/OsWQ7LnAgiuuZFW6AnBT1UxuI0QkErl8JwlIviWOLaiVl/vRV+ahZxf
	3Q2ZdXgGmZ34wpnTs26EdmNL255ER5BbRaMSeC9K87KFda4im9kyZ3OLZRe45iQyughCdj4D5FB
	0HAS5GICYam6g67clU8UZiKUo2SikR3+5uXEnzqWeC6gyDH767knN4grASjVG2oNmj7XDC8g2hr
	B8n3zJCFL8PE+Pe2g1pNJVtrtf9+/siugUg1QSDJYfwN7oZpy5tu5gnODANrxdSbsLCtbyRbUvw
	RTAFon/4eTYZKMJQBfPSn/Y34RTUDNhWTsCSKkyVMmWbYJVV9HFDjf651wbGpqGaVPzOTF+Eac+
	H/jH3TvoKaZMSjkvYXpoFp1yBIyVFQ3W1c0UxKwQ
X-Received: by 2002:a05:600c:a302:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb7347d930mr63274065e9.9.1794864317319;
        Mon, 16 Nov 2026 13:25:17 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm26340475e9.1.2026.11.16.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:16 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:25:07 +0000
Subject: [PATCH v2 2/2] cpufreq: dt-platdev: Add Halliday to blocklist
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
Message-Id: <20261116-halliday-cpufreq-v2-2-e518cc055457@gmail.com>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864310; l=881;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=2GcqGR0zihHNnFXHb5IImaTefMurA0fW5o4gSm0JefA=;
 b=4lc+g+lfF1maKT/cQEhVa2dHnEqxr9Y+m7dCjl3rPKrIxUad1nOfy9KT8AZ+/l5jbkMGdKmvS
 Ef8hYu3BiTDCLxJ4PgoQacYXz8x4Ckmxj84jXTaB+zf63OVWiNTiiSN
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

The Qualcomm Halliday platform uses the qcom-cpufreq-hw driver, so add
it to the cpufreq-dt-platdev driver's blocklist.

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bce4c87573a1..3d5709eaa08f 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -155,6 +155,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "nvidia,tegra234", },
 
 	{ .compatible = "qcom,apq8096", },
+	{ .compatible = "qcom,halliday", },
 	{ .compatible = "qcom,milos", },
 	{ .compatible = "qcom,msm8909", },
 	{ .compatible = "qcom,msm8996", },

-- 
2.55.0

