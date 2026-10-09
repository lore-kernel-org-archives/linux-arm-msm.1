Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B3339768D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534564; cv=none; b=AlabDYrIjGr7/p2C2lS4A/wew0H1rUZ3h4EP2j5FxPFrGwOrct90dsEu5RLezFQmFC9PHK51L6UHeNpt0Nmox0TDWTaJ1vTRuHXmd7BX44bTEe/at4PVFrEiyt5DsKvXQY3/x62dXhqacZ6p3GbhVFPGEAL83uVG9yQVq5gycpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534564; c=relaxed/simple;
	bh=JwCvDd5YzyK7COQjFOilO+tgzZeBuXPZW2kTiC91m14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nQg0l52prXm+0p+yQgXFJ75iLOO7fRRCLKuuIPEmoZE+AuUxMLvGtQPxJHakx2Ip3uD78HgbGNgOY60C/F086Bqwjh3wNOMzPQVh34vANiwYVyaNzcufPDqB8Xjdk0CMMlwe0F7rA5+Z03jLfR0lBd6TjNLeFuUPBmO58pdMcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvDTc0BZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PexE9nYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvDTc0BZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PexE9nYK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KQtI907058
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Lfj6oSCKPER8z+P3DkIH58XgLvSuXtrBMTqgQC09sw=; b=hvDTc0BZhw3sQkyr
	kLrYI23ohlUDBErsLIm4Af6CvSE/HSU6Ze/XKZtwOFHdtozaz07r4vOQEGgSpLSM
	fM3UxiWrzFOzhvtFi4USRX4T5juE3F5TUm1lLWcW7+mTVOGEryu8DTbB0rPycUox
	fBvVu6pw3x2ngMbQVyTINZAgAB8LXoiyObkKrR60JchD4F5+uhN2EjIPaRKB7r45
	99qRoPVpNWMxxg/A2r9x8XBMU8lnna90ekEihJHWRNg8OzO6ypfoIqOqeP2AGqQh
	MuUgB62Mck2892KtG0Xk9W6Qr+828c6clEvBBimRvJ8AUyCl2Fxau0ksjPoaqDBn
	szWIww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fmqtsed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:29:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so1095692385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534562; x=1792139362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Lfj6oSCKPER8z+P3DkIH58XgLvSuXtrBMTqgQC09sw=;
        b=PexE9nYKFlqrUr90a1+bqh5ZRfideJCGxqXv7qn4Hob3irfhjLgcGld2ps4+hHra4F
         7qAshmc8+voiwooKzqpPKfiE3pKATWozVs3YowoiUjUnFjv/rWS07Lb3/lxrb6CPItky
         eMJC2a8MI8sZdNW61A6g3nsVHAPGCegnYQkKP9eppcY6qeby6oqgeDOtpdbfB+lRb2fI
         00H7HNYxqz6kXdznvtuqy3pnm/HXVraKysadt7/dncOTZ1KkbqhzQ0wwcAjsp2rFzhF/
         4sxjhBGmlG/8+ejGvNdkCqWveV0Z2sJYRn/JOHF3XgHdk/igpyaO4x/PyFXyUx7ZzSbE
         hLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534562; x=1792139362;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Lfj6oSCKPER8z+P3DkIH58XgLvSuXtrBMTqgQC09sw=;
        b=FoKaQ++LBYdO6P+svI0a/Yb1CMBy39MOEszW3jxov5tNDXm7FSf2OdL9x7C+030Gq/
         61xNQtjZJS6x7CUe+FnZRp5RWyx1Ehu7qiZNRfuMsSomfjTX03tC2nKVL5p03OM1/OBo
         5spUSsv9yTO9FJd+DBuW2VCNfiXFDyeKcjbAPam5Oodk2yablUJRPFQGYX8u78H76+KQ
         u1C4UqqcXDEp6Et8bRkp9WeW7nldQx5j0/1MkBZGPK39UF20nHKqYRd1oxCuaYFfbvDo
         T2MYZkYjLdnAIH+5FS4SRBjD3kl0akfyqTCWAyc4ovyzifTEpVBvglvc1C6mMfXghJ/0
         8Ctg==
X-Forwarded-Encrypted: i=1; AKwUvBxmr5Xjv36/snUZcy0tnOGmMlVzLZbkUikMn+mnthD5xjITVSV5ZLx3xnpoI//xLqgrOUFRiKAIluhuGu7i@vger.kernel.org
X-Gm-Message-State: AFuF++nLdyCt0L9HQ1Nw7MNTgJeC/9Xk/iWeSYXg7paYzLvPu3Zycexs
	JopxkwX/7p0QlPVlOsCGiZ0y2CZ5B/DCqAhmctSVuwhvN5VjeUyIrifPDlu5HdAv1GOMW7vyROC
	60wJY8g6n5w4BgjWX8p13v7ItHuXtouirqk10jtw7hCTTy9RPQzFEd1vgE+ho6O1GUent
X-Gm-Gg: AYBFou2mevEWzImCs8YOPvUpn7yVmCMlaLeDQUCnQPFDbLr1lCd7kwu7j96iu4QU4/g
	sgto9go6CMS4ixQSPdXdNtDGKcSFmO9Bf3JpGZab4Wkq6FLRnRJSjAsbtaBpOXAyriSr0IqDRYZ
	dkLWXM9mAFGJsE6cBZIQP2q3gFk/0RoRQ8h5GNpetcLzX+QNN9hFC9sS+9B6gBzd0RV94dwxj31
	lH01+W/pB9NTmSwQtt6zDDOuuVX1A4XoGbGr9oBsTU3qs6z+6mAUGJn0v27fVqKSSgszIyJYIip
	AATFUGWePT8uK2ohWdvrPolSPGMdqI6UXAGD4XVadoTln5N3VgIP93pMR8diIufSj1JcL17wDC9
	Cy/pYxIq2jTBkRe7beShq9HkSh6EHajcmGs1opNGl2RzHoP6NWm4xzQOZHp2eJ60JQWTtAy6Pw2
	wiKnMRsGcgiH9h
X-Received: by 2002:a05:620a:8088:b0:93e:c12c:f11a with SMTP id af79cd13be357-93ec12d0581mr47266385a.70.1791534561605;
        Fri, 09 Oct 2026 01:29:21 -0700 (PDT)
X-Received: by 2002:a05:620a:8088:b0:93e:c12c:f11a with SMTP id af79cd13be357-93ec12d0581mr47264385a.70.1791534561145;
        Fri, 09 Oct 2026 01:29:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3caab0asm4295171fa.18.2026.10.09.01.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:29:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Xilin Wu <sophon@radxa.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniele Briguglio <hello@superkali.me>
In-Reply-To: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: qcom: Add support for
 Radxa Dragon Q8B
Message-Id: <179153455955.2970577.14103639336377928226.b4-ty@b4>
Date: Fri, 09 Oct 2026 11:29:19 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX2chzCttMNvmx
 qlyyMK/iEsIqNFH0EIDCNzySam0zSDH2v1l42bseXDPf6vut4tbKPBclqiCQrq8LmR40Yl52UgH
 ncBebbQ9zAJemMQ5gaDpw4Cd2e7cfhs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX3ApS8PKNEE1L
 8+Vz+XuWLinhNAQ86CtUD5AqN/8KzCOuzOlflwOyYYXbeC3wFuP7Yt+mK7tst0q0uavjjpX/wWX
 jnX71YSlUHS84THbMCaIZ2FFAYVeoTwjdhFuhg3n8mw1Puo/7BwK3EXGm6FrN6oPewPYl/B/D4n
 EDkcJBaKOWqIzMF+JqHjFqZhGHQ7JPoOzCf+DC4m2X1oGOHC6jG5EuZ01U4VQQ+fA09uOpxtcvX
 wGPnriFdggB+ZEmccBCnwO/g0FYpONlpTJ9oTTz3ZhM5XLtVfueULQHVs27xn5v67OZSCt03jpC
 KZJVKtYoLNPUImDe76s90qADCTZUH5Y/M2QiEZr54e0PKo70d2Et5VQPgf28V10lU2QxUUAjhs1
 03AnKSJL6MoiaLS8YD5NTnDzItMsgMkgbCYaOCdu0TRW7yTivCIh4jyUFyjjTukoFoPmXn8FOI+
 uJw6t75YlmtZj9uyhRg==
X-Proofpoint-GUID: EmrHC1riMWS3MBLNpHQKF9EnlWzoiYGu
X-Proofpoint-ORIG-GUID: EmrHC1riMWS3MBLNpHQKF9EnlWzoiYGu
X-Authority-Analysis: v=2.4 cv=IqCL47/g c=1 sm=1 tr=0 ts=6ac8a5e2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=qk-nXHHSopyJew9tVzIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

On Fri, 09 Oct 2026 15:55:05 +0800, Xilin Wu wrote:
> The Radxa Dragon Q8B is a single-board computer based on the Qualcomm
> Snapdragon 8cx Gen 3 (SC8280XP) platform.
> 
> The board provides UFS and microSD storage, two M.2 M-key slots, an M.2
> E-key slot, a QPS615/TC9563 PCIe switch, USB Type-C ports with DisplayPort
> alternate mode, USB Type-A ports, HDMI 2.1 output, headset audio and
> a 40-pin expansion header.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/4] dt-bindings: display: bridge: simple: document Chrontel CH7218A
      commit: 377682cf917027396211426c509cae5785305ba8
[2/4] drm/bridge: simple: add Chrontel CH7218A
      commit: f146c6086b792cb2c6b3ce5106f0cce62e408df8

Best regards,
-- 
With best wishes
Dmitry


