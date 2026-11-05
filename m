Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894988;
	b=bx6hyn+Kz5FR6vFcsj2oxXL4vjbcbZr9XHr+UVflTTL88pvw34C8DcMkCS+BCWYJy73j
	 o/8lAg2rs4/pMNYFFQ8bwr2T/9DNtrW+uhOmsFfjU+3u9RyDe8scM5XNXYdqssS/ViKQ7
	 c+oAeVVFcI2GhPi9+UsOCTQEtdDplHRfAdO/R7NHzaxVaaHV/13qjjU/9nmyv3LtO2kWy
	 dBINFfjZMq3VUc6t3ZHV7HvsnCVRdvzqIMtiOb8Q5m1w7S1JkqAFgCZQSE6QU5X+5xkh/
	 le1KK68IjKdBgWig/3zHosiL+Y5IYcAg/4VCtccwJIq7eObexeXC5qNu0w8ro69Brkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=alDDpQVgxqZH6sAU2C4QynFmWrx1vOIuscSzlyYUj28=;
	b=w0r90U/PoZXQWS8XILFYg+XdpCzZtQOv59o3OotFPPx/CMQwzEoE78XrCmOunNeQ9deA
	 MEUk/Wd9uvZGXsdnrIQNhX2QUiJ3XjR49AZ6l1ldxuYdLiKuPKsRhEFvPG4zJkzCLkJHh
	 gYXVJEWDWhOqG8EoEWAHnufleAwcAJdqaQwTURmjqlinyb6nSj4o5fE8FFoaAvhoZTU8G
	 R+4OmWx4YnwyHNotg9I3xPVYlHCDWY/z071x2xxvs+sOBVtZEAS3Bv15vS0UcnZQXOox/
	 6O8jugxCaf/0/DLUGP5HEBTaIsBKai7wu3V5PJHK32+Cf1BKrsWm/bYGvHzdYR48x1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Icvg/cUz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ON59czEi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144E4606BEAC
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 16:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 144E4606BEAC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Icvg/cUz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ON59czEi
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQGIC4134298
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 16:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=alDDpQVgxqZH6sAU2C4Qyn
	FmWrx1vOIuscSzlyYUj28=; b=Icvg/cUzAMONGdEoCfCXVwlJIDqhcVqL/FHewk
	zwe4kW/LEI+pMv2ojoRWSziyT2UPNw/iUJtAv+Ntx0J9Let7Sh4LA0DyQ5QOtrci
	0fuuAO0w8rxnhK3Zmq7U1tyhbAuqx8O+iM5esu8N75RPBI6bdhe7U7GcsZsLCFiv
	0LKjnW/Fs7RcZQ0/qHZaQ3OPBqlcrDHTArHh4E/P+CcCUj2BmTIP/PEHRP5Tu2mD
	B3QPMVTUfVqkKKrJ/Tz0NBh6lqFeNb4JLc7vBbWzkukJQudtXyerSTndZpaW8esE
	Fyd1BEbAGFNOUgUYjwhxr11umlYP4DlOH1JJqVXdSseLIb1Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrksqak6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 16:09:45 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c6c1e082bso15548356d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793894985; x=1794499785; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=alDDpQVgxqZH6sAU2C4QynFmWrx1vOIuscSzlyYUj28=;
        b=ON59czEi+26AjtMRJicE4aswrG53lpeb7P65JYZ0nO0yGJYPx2z60F0ZWGWaMSZAU6
         u6CsaVGJsmanqXQZICmpFr/vQCbR81qFBkyImHEtaykOEaf63XjqgqpHCBJX/Exda7wU
         FwjK/BuOv7TZj9/0mrpJiZmzeQnto845dQBDNhm4Qcb4whhIgZwYmWxIj6qszj7SoOrE
         gw9AmaRJ9fLUKcHT6JS0ESLVehJHqm+Nwko6FBorJu6mcoMRamzScuH0CEOVEkM12p4t
         6o+oL3iuXSCuCTZMoFjcF8dEeRJW3QoT5p2R7tuny+eH1VnzStxr0VzP3tViqn6CX7V8
         lfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894985; x=1794499785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=alDDpQVgxqZH6sAU2C4QynFmWrx1vOIuscSzlyYUj28=;
        b=xSWztucVDFoN0XDb+8Z13GR3pMe3D6JQGcyWXS8V3swvRUps9paeb3imLs4lokIjuw
         8zPrdKkLCreOskZ6rLU4tQ5TrsMEJIYAcoyMoJ0Q4LRjaXEAZiwSQ0waSqQASfgjnDOK
         I6qANVD2o2ohwCVdlLHdqSC5RnF22qmkU9vCBPxBf7lRMzQFC129TVr5AiNfYURKakRg
         h9IdrgId3hp43e9f7FdCMyJXiPL2Kv2KjCerBD5NkaJgelSHOfDOljd7cX+5I7a62TCv
         nHL6TmnS/pCyqha3ojh25caaNZbntVECy+6jWKLaYidoh2IcDaf/5X7+RZgcZxPces0e
         8Irg==
X-Gm-Message-State: APuU4Z+cSjCfSoQJtlf9OdN2fafeX4KTz4rjh+EEOw3DadhSD+Elx42m
	uiWpGb+KwThVjUNvAsKz4UAndtFrSvrdMKv5oQ/so71y/vCSYy3S92ZjjGVLWEig6/PdJRlINsK
	kajbA8ypBs8+i3dICF69fsYUuAMTIzxc5UUgFFbdKasBzsRQiPkdt6aIIanmZyghEXlmw
X-Gm-Gg: AYBFou0isSUFjDLHMUC+336PjDv4zXW6s0zLTFkbC67647VfmrAvkQf5uIFDYRZsAHU
	BhbV+sM0ZOYkcNmCB0hIYtOjBoENTe+fCdjwBPaVGkOIXYllaT0p/fV3eOiEzIHKUuUT/w/1pvp
	L4ElDikUSj9HJXQDw9d1XbjLhCWnR4+j2Mbe2JMY8FG02fvEmgR5Zqs6FkfuAFeyolgxft6HakJ
	4L+65N/h0be2xI1teVDMXV1V2VBadY9DYGd+MCjv/663bckKLCojcxr4MLevxbE8erVuMOhBjO6
	2xOrBvaaZwv1QlJWU1zOSvqgU3RijqouYIbYQJN9kLHWkqckshOX20cCHmqh9uh+oNJuhfSFfCr
	gL1MYLToI8Pkbh9x5Mfqx+2vPCE2mLeKeq7D8sXCDjFMdTdj0A8/yOYNFWRSqnvQ7saRaQZe9yV
	pdTQ==
X-Received: by 2002:a05:620a:1722:b0:93f:3193:ac09 with SMTP id af79cd13be357-945e16aa58fmr492345485a.15.1793894985033;
        Thu, 05 Nov 2026 08:09:45 -0800 (PST)
X-Received: by 2002:a05:620a:1722:b0:93f:3193:ac09 with SMTP id af79cd13be357-945e16aa58fmr492339085a.15.1793894984465;
        Thu, 05 Nov 2026 08:09:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm194448535e9.3.2026.11.05.08.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:09:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 17:09:40 +0100
Subject: [PATCH] pinctrl: qcom: fix a use-after-free bug in system shutdown
 path
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
Message-Id: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEOq7GoC/x3MQQqAIBBA0avErBtwDF10lWghNtVAaWlFEN09a
 fkW/z+QOQlnaKsHEl+SJYYCqivwswsTowzFoJW2RMrgJsEfacHdxxVPN6JRisgYapzVULIt8Sj
 3v+z69/0ABpqrAmIAAAA=
X-Change-ID: 20261105-pinctrl-qcom-uaf-500115513a62
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2187;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A2DQoDWn/29YKhLa6YBv0jqvd6fM7wxpGCmvsaeLJwg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7KpG9QAU6OFUWdNpvOc2kZpsAWHV4lAkH50U9
 P8gwnFMxv6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyqRgAKCRAFnS7L/zaE
 w2jID/96DvDk+mEoE6LJQx2NH26Z+k432RMQwT97PDX54Hr5cxLPxJh2nJYLAVqTYtj4rVeOn4s
 L2RtSGc+zCIyxwE7Ywk53LaH6kwssR1qihIIYaHDF6c4T1W/QM/NUOp3qseMmCekAbrxkkzdr7P
 kNm24MYsowwbrXlG4q1Sfw+U3BKTjBG5uW+k4cN/wpRvpznOJZ4I61Ip5ziuWc1BYH89I3AnJet
 yw9vXhFgwQipnCLc/SfP/SgR4DcqPN+WQGIrKu2yfibck/jNjIuhOS/W/EAYfCV4JVZ2HArsjjz
 XeLxmG7ursPRDj1LZb6L6XZeFoTI/LQxVWpikna6HKYHFPxeR54mdJCSjybKnFXCcptVuv5D5PT
 ZNYK47+6bfDwo2fvXvFvyk4C5NQV4DLATt+L7haNTTYjLWWTebq2etASWxelRWwTpUphFyZRsHm
 vBp6WtbY8uMEWl4fKV8EE1BURVwvJgkzsZYriqiNUtBEBXKfswj8n0M7LrnV1BpYCSnsD/UHzJp
 vJRQtfmL0U9/6ez1YHbDZgg74NYfLKepFObxFVPBqLp1dg6kim6uKwQJ9Pl5nDGHSQGfxY495tq
 gzmq6OaEIWhYoNaCSYKw6Hgp6fZtTiU/AGAawF435aXNGsC4tiTWIs91qq8WC2U8nV5xz68PsYn
 6V+oveQHzYFl3IQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX3a1790Yd1VeU
 DkURqyXqhudt/dNZLAjIZzj0oFCqcmzNtIc2dNugmB0folIaD0naHRDet5SzZg0C0F2qxU4090r
 tnXqraqI3ez0iQlvL7c2TxNVm3YHlzjhAApKhWOJ7ps7B0Oz5hxWSUI9FJhsVRfKyj47oTlGC8Y
 lJd2x5+z/ndBi8H6Tdyn9Em/hIRvS39vmhFXJ51A9RUw5+jgqu+3yUpv0BL12eJlpzE2hZMhnu8
 31baDIFEF6bj4oBnMr8+A+OEah2gGQzCDv6FSdDfimed5zjRrRaocI+g2XT3C/L1n2KSAbrNU3v
 2BNCi33X0r1XGQLLkLey/Ga5t1rxh2J4beURN6bpKkjvpA1PLGIte+LaJRHC3lW/CSg8gWP/8oF
 SjEv7eTwvxEcCjZDBFsw3lqfuvogD3xw9q6R3zz2xLEr/uA4kzNYIsTNEXVvP0xpEDtlN47JvuO
 biP2L7WXQAkUD34vnYg==
X-Proofpoint-ORIG-GUID: ygGpxSgwToxbns174lBJkexief8vzWBZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NCBTYWx0ZWRfX2EPwnBfxcxGL
 umS7Uom25Jlvl9tJ+A+FTwkkN/CS36zKEut8kOu9kFpPiJVj/0U49DttpcpLeDji3AXosLvrcL/
 O0Krj+rlpQMUObaE35D1pFwOrL6XZ0M=
X-Authority-Analysis: v=2.4 cv=CIe/zhrD c=1 sm=1 tr=0 ts=6aecaa49 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4h6XKkIfv3rSTLBNyJgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: ygGpxSgwToxbns174lBJkexief8vzWBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050064

msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
unconditionally populates the global variables poweroff_pctrl and
pm_power_off.

If msm_pinctrl_probe() subsequently fails, devres resources - including
the memory allocated for pctrl - are automatically freed. However, the
global pointers are never cleared, resulting in a use-after-free during
kernel_power_off().

Schedule a devres action clearing the global pointers that runs before
the pctrl memory is freed.

Cc: stable@vger.kernel.org
Closes: https://sashiko.dev/#/bug/linux-0c3a18a4-3de8-489b-abc9-e9e3a8641ed2
Fixes: ad64498762dd ("pinctrl: qcom: Hook pm_power_down for shutdown support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 32aa7b919e24a0e614078ddc70a248c746e4813b..6ddbec7c27664b5b137ae1bdf668dd88a0f5e224 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1561,9 +1561,15 @@ static void msm_ps_hold_poweroff(void)
 	msm_ps_hold_restart(&data);
 }
 
+static void msm_pinctrl_clear_poweroff(void *data)
+{
+	poweroff_pctrl = NULL;
+	pm_power_off = NULL;
+}
+
 static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 {
-	int i;
+	int i, ret;
 	const struct pinfunction *func = pctrl->soc->functions;
 
 	for (i = 0; i < pctrl->soc->nfunctions; i++)
@@ -1577,6 +1583,13 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 					"failed to setup restart handler.\n");
 			poweroff_pctrl = pctrl;
 			pm_power_off = msm_ps_hold_poweroff;
+
+			ret = devm_add_action_or_reset(pctrl->dev,
+					msm_pinctrl_clear_poweroff, NULL);
+			if (ret)
+				dev_err(pctrl->dev,
+					"Failed to register the poweroff cleanup action.\n");
+
 			break;
 		}
 }

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-pinctrl-qcom-uaf-500115513a62

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

