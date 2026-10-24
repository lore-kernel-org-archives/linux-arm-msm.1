Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802141;
	b=Lf5ipIavHGG6txrgJ03YfAwF8QVT2gf4FN062Rpkb+XmDSh6oemhG/SCZK65/EWHp03b
	 gELYFCFsXefIvj2xZcgdM6ZI8BtzoIx7ma0CFxTi5H0+ZiZVLMqmjIVPTt5tm7P3x6R+J
	 /u0oO/zzMOTaks4nlB+uWamAdEHGlv/YhF3+nrv472iClYmQ1RHOWKMYJPRJg11JG5Tl7
	 eUIADPJVrAjYvuUUMIiQQ2yxg4SR8ZpieREO0yDcWkg3z8Fu+oT1sgl9FESjDCY6zrpZu
	 uP8/eB4BNlQyE3LPHQlQTDXikL6/xLipT+E7sxyd96MBEnGfEMVdiNJav8Y2IdFRaqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
	b=Rrm91Y7YWtOzSCvXeFxqkIDv/lRhDrK/Xbbfz3CoSW//GGWOi6GU4hCKRrddHHgQwjsC
	 p5aSOnyy+6E89/A0h6tF9E2dX0fKt1z9t0Tp4n5rPKuas7baO8eZJ6ZKTXAshd1vRh7Cm
	 TjWDn4Mu2DkD19Z7mFWukNBGh+z/w5bPUAdMIgtjpxKOoSyqu++72KTeHnL+k4XYZjwAy
	 /Mvb3M3NDgAwMxipj5Em2VgwIeVHUiKp7pJM1+4WhfAYM9sO4qGtZdSgmnExfzAwvBcSt
	 2QKEz7vCcXEh+AzVVNAIlhwTkVJ+BAeMI4sIrX2pqutyfL/s467siKPIwe5oZNSG91w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV1X7e8Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWa11EDt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B25606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90B25606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV1X7e8Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWa11EDt
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvSkT2964014
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DUaa2wlIXAwdRHkconzS2i
	tK3kWYEvU9w8eNOhhQ0hM=; b=jV1X7e8YMqZw6ch/Q7ap8u9m0+lOjPsQuFvRm1
	A1S1qywx16QPYKZYOc+af1H9QxeS77iCr96cez5DeJ7fyL/04GeZCeaC0szSaT46
	ogdg81DsnOCiOTpVf3bvMG1g6G4JIQ3ee8uMBoAK2bLSO020pfWIYdeQ0CR30yBT
	cA92iaa4Cu0Uc3pTOl83edB6PCHlg3u4feE9yRxi6Wd8Q1Iu/6IXE6bi7YOEn6Jr
	BTdaLtAsEb4Tk5fNd222U4dLBfrSVOxQirYso6VQeoYqmbliK4+JaJ0XXcIlK7nG
	OdphzIBBWzo00DN8t2Cf+GJ3ZBwCi/aD40bIFNhA6WDKOzmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgatc9hns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:35:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso366182185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802139; x=1793406939; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
        b=hWa11EDtP1yO2f0u8m0PelpD4m0GiCtq2NnME6qQd+VfNA2pwXpP6W+RzhldQ0m0hf
         G8o9Y5mR5Tk9vCGV92Kk9qoDQiD0xeNveQAGgIG/6UrIhIP0vPhoWKRAi5xdyFCRKL5K
         kP85hPx/LEB2kfltoWwIsqxdGRQQ23tZnD7yW4HpsiJ60qRZFITmnOUK6UyX6vLO02UG
         TLqRRhZ5W3zKEWUvqazcp2Zno11UkIsICvVlVqnjBDvTHQL9qFDZwY6bo3B/tdDTTkno
         J5RkcT9GNYj2LLeqgkjNy1B9FrQHN3Z0AfIPh24N7rdPXMZfNnjStSDVaALZTkqGp77i
         CysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802139; x=1793406939;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DUaa2wlIXAwdRHkconzS2itK3kWYEvU9w8eNOhhQ0hM=;
        b=qsKetjNEzD6YwUXHJeNHwlOn11KGnGV6mSjDFYeRUJ+ZaqwmK+yYHBzPelBqx3FEnG
         xoIhzxYuJj1TKs+IW8XZe7ZqtPgMYdF3kuy5ppreYe0rl4uVdrbd4H/cQhym5jZqZK3N
         9vitbf0Vp/8/uNU64GSa0WBkktyHbHYB2Aedw+NkOjYGLfDemFtP47RDNIpB/+XJyt4P
         T7USUZC00DsO7IGsVn5T2V8MX7oVK3dENIhkJuVzI8/7fSsA54bCKxUjsI3w904cMIQf
         lb+TQEVPVdSX79LDcuUF+2vPN9nRqR76MwysAO1v1n31NhpoPKwxZYWiHEUTYVCyBDvC
         NkXQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4s+Jvw7wEpFLU7kKA+gHHYuEGMiZfg+9dNeK+o/k2aRqpuTpe+rGdQmC2oc1cEQsSZWISK2pQkux93vSv@vger.kernel.org
X-Gm-Message-State: AFq9FYLWR8qRo0z7+R9IfW6+sKKgjEfbTKj9IWbrTBs0cOLYECvNd1QA
	aj3YFt0wfTqHvb+OjnSWPLA+BGIyzDhqxiY5zSWmYSaSXZxUpQYxwLliMmkMWTVIUET6VkqSQ9L
	RqhWi9Cojv8v/7Y6+5PpW6OO1PA30VJR9ODh85ZkVGiTTPKWpwIEHUCzGR+wKvn9qdQXK
X-Gm-Gg: AYBFou25pQAgeudKh2M9ySfv/xsz5/CRtA/hWOAacu5Rh+lq/D9rX7ocI32knHEAhtw
	2nir7tSN1aLxWixoRSMruMMvAnZqilyEgtHwkST1Kpehjt7b4Im2gv8sggshbRNl/5jokMOBhpy
	fnq6XWhA9XuO0FFDZqX8fsRx9l8qqERJyZ9wVinJ5SP0x/m74UwSLYgoEacX60UWhd92ccP99Av
	l7pEVA5JjDZOZ8SCYnOmRx+5i66GRXNHvhf/Z5tYZoTq0D7mbWdXXjbnE/S09T3g0dlx2w5+R+x
	aDByCX62Cf8Dotf2uDRBprO6tRHZLEq0iyVRqsMZ/CzfPcbRViWvq0yPGK/knoK15cxAevcW27n
	yQ205+x9YdkhMMWmZr/4c9XK54a1uin48jaYbeuskUrn/OitF8ApSU8YO8MeQZY9wgFAa5FvsHo
	fbQ7rtuKACo3sH
X-Received: by 2002:a05:620a:8390:b0:93b:be6d:4f3e with SMTP id af79cd13be357-940ef913ca6mr127362785a.25.1792802138514;
        Fri, 23 Oct 2026 17:35:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8390:b0:93b:be6d:4f3e with SMTP id af79cd13be357-940ef913ca6mr127356585a.25.1792802137971;
        Fri, 23 Oct 2026 17:35:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:35:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 0/9] drm: handle IRQ_HPD events correctly
Date: Sat, 24 Oct 2026 03:35:16 +0300
Message-Id: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAET922oC/3XPTW7DIBAF4KtErEs0DBjirHqPqgt+hoaqsRPjW
 K2i3L2Qqk1UxxukJw3fvDmzTEOizLarMxtoSjn1XQmbpxXzO9u9EU+hZIaAGpRQfHcIPA1HThN
 1Y+Zk0Hkw2jZRsPLpMFBMn1fw5fUn55N7Jz9WpU7sUh774eu6cRJ17hfX//FJcODCOhGFjw4dP
 vc5r48n++H7/X5dHlZ3THinIMwULIoCjJHQUEvtgiLvFTFTZFVUQBcVhOiXuqibomEzU1RRJDi
 NTspGbcyC0tyU9sFFTVFiFIEAWvBmqYv+UwQgzhRdu0hDVoZgrV5SzL0iZ4opSmOstMWJ0NID5
 XK5fAP2By6daQIAAA==
X-Change-ID: 20260414-hpd-irq-events-e72bc076a5f1
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6437;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tc/V3kY1g/aFDuKXC2Rr02qE2Mq3jARnBUYzK+yIUBM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1HQty/fk/GhbBTh48kUr5wdSBht1C93PaEf
 7Jjh5065T2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9RwAKCRCLPIo+Aiko
 1WcFB/4yLkQEreXYZW3IpFJoRUXl9AKX9Bfugvanb0aEWQZqry3VNesZSHDkrzzQyLiL9h7fipD
 XhmBiAwfdiPRHrBIMZLAbL1lRIAJrMnG258DCXsYvgRJo4Jg+Qy8/BWS0/jzLIZYCFMH6NSnHmM
 QkxK1AIzh9aZOWyGavyIAnO7ZOym0xJCF4bXN5UQt/LX53w+eL39PV0EVk8g74r+nA/LGlZQSNl
 ikd7WflMdZi2IPsVHq/FZRBL26Uq+yIVpnUitgG9CrlokjeAAcnA5+A9ZmJQdNhjRfzlQ/lbquY
 NR5PUToFTZGy93DNBzsboDt+ujZaMTyi2bjaDYyB1Jq/uGD7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXzqPf6NSSjrMZ
 uB10LfVYoHOdGQCkamf6RJLBP70lSU+nO8S+7IF0gOGuWxKg9EUsI9oJyndFpZm65w3nMryMt3L
 ysf2NQuWACmufq+TdpqiebKj/6xADDQgf66/3+bi+wx9bF0+EQ6ki9uao/15MEUklm2PgCiK2Fp
 520RxlkZwHAXmFkAfXRubuJdSZ0LsyfYbJyhIcrU9LNYUMigVIVdWb0DwUBxATavXKKJ3SiN2ui
 kFE8Z8uoo6bwW/VxSAliltImRYbVfSeNTxr3eXmOOyU5P5EEeJyjxF9Aj7ALKPhR+4J3dFuJyE3
 vivcDfQ3yUgTiFzu1P+2fDf59EiJofcB2Jp/Bt8taMgDlr35ZCEeP0R7MAD/gexFtAA7GPJBRqk
 cnAilUmqT/tiFj8Nl3NRcrp8de0K3heCQFGEviXy6clq1wEUmx3ZJLEvN+5mwUytiVKORq2VOT0
 yS0tFqkHUzyOWBUyqkA==
X-Proofpoint-GUID: hDxv2eqk0BN2mo3cQAGHfLyDCCc24hFG
X-Authority-Analysis: v=2.4 cv=Scxi5fRu c=1 sm=1 tr=0 ts=6adbfd5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=ag1SF4gXAAAA:8 a=KKAkSRfTAAAA:8 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8
 a=GFqr32JmAAAA:8 a=IpJZQVW2AAAA:8 a=mK_AVkanAAAA:8 a=tVI0ZWmoAAAA:8
 a=s8YR1HE3AAAA:8 a=e5mUnYsNAAAA:8 a=JfrnYn6hAAAA:8 a=uf6nnPeBmoxfmv3DkCAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=f02Ha7HRcztGgdyUxOxW:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=3gWm3jAn84ENXaBijsEo:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=jGH_LyMDp9YhSvY-UuyI:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: hDxv2eqk0BN2mo3cQAGHfLyDCCc24hFG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfXwKv2Xrh/Eiae
 LNHNRQhMaWXahhd7ZgA9u5TRGjYb0QzL5e7jxON8NZBgHNtlzgzMHDxsdvkQVcJBAhA69pDNLp9
 LC3JvCTE32mY4g6BYgI6wFua0N9CV8o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001

Both DisplayPort and HDMI standards define a way for the Sink / display
to notify the Source / host about some kinds of events. In case of HDMI
it's as simple as singnalling changes to the EDID. In case of
DisplayPort it's more complicated and requires actual checking of the
DPCD registers.

Currently USB-C drivers don't have a way to deliver the IRQ_HPD
notifications, leading to missing MST notifications. Provide necessary
plumbing to let IRQ_HPD events be passed to the DisplayPort drivers.

Note: the Yoga C630 UCSI driver and Acer Aspire1 EC driver are not yet
enabled to send the IRQ_HPD events. Both of them would need some more
reverse engineering to find out how the event is being reported by the
EC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v8:
- Moved the OMAP DSS HDMI5 chunk (Sashiko)
- Link to v7: https://patch.msgid.link/20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com

Changes in v7:
- Fix build error in drm/msm/dp, forgot to squash a patch
- Link to v6: https://patch.msgid.link/20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com

Changes in v6:
- Corrected indentation of args after the function rename (Chaoyi Chen)
- Reordered / rehashed patches to be more logical (Chaoyi Chen)
- Fixed build error in the OMAPDSS HDMI driver (Sashiko)
- Fixed IRQ_HPD vs PLUG interaction in drm/msm/dp (Sashiko)
- Link to v5: https://patch.msgid.link/20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com

Changes in v5:
- Renamed drm_connector_status_extra to drm_connector_dp_event (Maxime)
- Link to v4: https://patch.msgid.link/20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com

Changes in v4:
- Renamed drm_connector_oob_hotplug_event() to
  drm_connector_dp_oob_status() (Maxime)
- Reworked commit messages, explaining what it is about (Bjorn)
- Rearranged commits, making them a bit more logical.
- Link to v3: https://patch.msgid.link/20260421-hpd-irq-events-v3-0-44d2bf40dfc2@oss.qualcomm.com

Changes in v3:
- Fixed build error if aux bridges are disabled (Intel GFX CI)
- Link to v2: https://patch.msgid.link/20260420-hpd-irq-events-v2-0-402ffe27e9e9@oss.qualcomm.com

Changes in v2:
- Change irq_hpd arg to be an enum, possibly desribing other uses (Toni)
- Account for that, chaning the API accordingly (with_irq -> extra,
  etc.)
- Wire up AUX bridge notifications
- Link to v1: https://patch.msgid.link/20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com

To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
To: Francesco Dolcini <francesco@dolcini.it>
To: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---
Dmitry Baryshkov (9):
      drm/connector: report out-of-band IRQ_HPD events
      drm/connector: pass down IRQ_HPD to the drivers
      drm/bridge: pass down IRQ_HPD to the drivers
      drm/bridge: pass extra events to the HPD callback
      drm/bridge: aux-hpd: let drivers pass IRQ_HPD events
      drm/msm/dp: don't take extra references on multiple plug events
      drm/msm/dp: handle the IRQ_HPD events reported by USB-C
      soc: qcom: pmic-glink-altmode: pass down HPD_IRQ events
      usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ events

 drivers/gpu/drm/bridge/aux-hpd-bridge.c        | 11 +++++----
 drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 22 ++++++++++--------
 drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                | 22 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 12 +++++++---
 drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
 drivers/soc/qcom/pmic_glink_altmode.c          |  6 ++++-
 drivers/usb/typec/altmodes/displayport.c       | 25 +++++++++++++--------
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c    | 11 +++++----
 include/drm/bridge/aux-bridge.h                | 13 +++++++++--
 include/drm/drm_bridge.h                       | 31 +++++++++++++++++++++-----
 include/drm/drm_connector.h                    | 24 +++++++++++++++++---
 20 files changed, 158 insertions(+), 66 deletions(-)
---
base-commit: 725953d4da85cfb97a4c309fad6346b72f8529e7
change-id: 20260414-hpd-irq-events-e72bc076a5f1

Best regards,
--  
With best wishes
Dmitry

