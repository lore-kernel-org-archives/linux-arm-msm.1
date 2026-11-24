Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550515;
	b=Wg89/qHLt9TsfFCGFn0sBpda1uKFU7A85fqrepHeK87Cf+a3xh3Bs3DNbUTZfykSp4S2
	 wktndcMCRDZnhE9QFuJTobAvmUJVsmwOfVOS27RGVBCOCsZMCqvoUMjtXh5heLUJJK/ME
	 hGh6Go0fl54wnoj+EzleH1rB0f9ls5j64e9AETfTMkhnytdFPdA46EJz6Fq/1AqLGISbC
	 Fw1jgF5NEqYb7+HUpzv0Z4ysuyL+hpyBl7LBTSFn/Wz5oX4D1tOwZ4iulur4tHmv0uE/d
	 J60SNJqGTfTrvTNDzabHrXd+zfuOEePLYe3NwY+vQZtfWodmVWs1uJysurf12Bu8nKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
	b=IgK8cRDpD0nUnDaB/9ld/tdlK3FN7W6CUjmCNy48x0Po0K0QEq2Hgk+g95czm1nvBO9J
	 ifPHHyPDcQK2lpSpQCiq9rd7dcogwU+6fInOHeM6LPW/7ZYYj7V+FskKUg2xVb9h7jUHf
	 zsdZahEP5uBtCpzOE+uaZ8fU8h6zjf6yF4ZqnInuHdY4n3AlCk9T1uSojbqSaB60uVD46
	 zpsLVc2fSxQdGn/ud0KRwbiqdLaUm41QshVPFmLcoW3VvHrCNPfcDlLZEZMTvsqNsLW2H
	 cC3ZRM3YlY9pqpPpuP2d2luk4Rf2HqIsAg3yu49XvxqNcgq+BiRXzQ7pE/B5e3W0XQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mbn/v1qr";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuvqWbU8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B5606A688
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 920B5606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mbn/v1qr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OuvqWbU8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOIXKTN1767112
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=; b=Mbn/v1qrEphKP6KH
	QaIjKnLmuVnDvXfbLR6ZtxJdtug750+GoiZnmF40mZeOHvKWoDt63ndD2ZwZXIzj
	gaKsI5mTH8d0CDotUO8cNR8JiCinSUgae2+s1PRRuqCvMvGyCS3laYuVjP8FrNPo
	/Ss9riJxY6fEqH8UMf3VcGJOeR75lD5JNoXVub45yZI/n3fBJLYsC+Tftu7eBkef
	nTjgiOrHVucjsX6amchlYUEyoV5XKJo/z6UFRH+qmkoDT2JzTv1Ydv7fAgZzU4Nv
	oMC0v1eG75HZ4SQB7Pi5Jik24I1IgjuaCpSevqNtqtFzXQZBgro5+VYp0X7YPV9X
	hkivAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs8uak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 20:01:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso58365485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 12:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550513; x=1796155313; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=OuvqWbU8JJYCbjLLyksHQInVkYq5GiNguQxohBWYa2miYRiGX+otHvzcOjSq+rF0K7
         brC5g/b0+d/0Vt440D179Tx/5g35ry7rPtcwOJhnjkjzirm/8+aGS5Ow3mesoY08bae0
         xN9nBCrGHmlzmnmoJ2Q7m7c6YqTo4Co+Yli9qikXq9GBT90SdlasZF+SMfn6ju3QdVSr
         M+C8TzQO5nyi6wBu0QCDJsgwUFKbqGwjsinISXhLDKuGpW3MGxJQWMjcqZg87k6Wsks2
         9kGo98s266gmdid5TL4sv6NIag1t0aI43qmJdOuOcjw2uGk5/7N5fPnpbjBC8oAuoBy9
         9b9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550513; x=1796155313;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zy+iehtUsspoMXUA/AtEi2Wy/F+ut0xsQzXWd1oWWZ4=;
        b=jzsgEDoIOt2k27ZR9bj7vjsewmxHt8maRLYrGF/ln2mSJMWBz0aFEGlzyjWNEDhC6r
         CoaoIG6qYfH8gcZgz6nzQjMzZh2xcOVsCz7KIvxZd8gWHioGT8DImkFnyI3vRttQKPgx
         Bj+ko2xvJ6jS3sG43v96tNqOeQLXrxIloYp0yHg/zcP+HMQPU+UyR7nXXYmmu9O86RuU
         Wjtf3lWGmUvSfyigt3CULC1vnE1YQUQw8hw+vAFGibUBgagkz1jrIe23ZSfkOvT/W86V
         lZtAsem6E4JqXtlpuBogJROVsRUsJsFK23IE0az1wNfXqxPbdyEoPm60r9JtCcUW4PDs
         Mi2Q==
X-Gm-Message-State: APuU4Z+6RU1v6KZCX0s4NipiLedQqaSxDadWxCOJI5BT/D5pg/kn2ELM
	G5SaHmO0mKLYlK0mgyxEPUNn04q2cRum+r5Y/CWY0XQ5y56mvwBZ34Jl8m8PYL3uTpwOPTwu7fO
	19s6sXR794uYrYcP4nqDMStg586UEuej5rgGAShaGboUZiPoSiKVjkhc33B/qvk1qOzho
X-Gm-Gg: AZFdTZfFZDgsoagtDQeKyKJiPrIPTNRnNyi0W7vrM37Xg5lm/8x8gVwr3uIIsvLwyUi
	xVOzPe4yITr5JZ2X65H3+kMESRycvkCookS6oTYreO/FSp6E8rOIZ5DOvmFJipCVH25Va3++BNJ
	6cIS6lhbHA1ZfZmmrfRGrEjWAKyaV04uO2R+CTuZGJUk9v7SHVsj5wmRJWDJXZkBhgv6s5161oe
	p+it89pwsIRmVjPUsrmrtV18v5xfqioWbY8yb+Gr16Rev8sab59BH7kYVhun6hL1bOIkmK6DEOK
	+9/GYGAzuDAFQx0PyG0we5f83RyyCmUTa+XvsJtYJHftMXb0siMFI9t2umwKxhiLE55WqaotxXr
	BH4C6407eCceLig72OB3QyyIHWcA1JTF/LPZu7bxiVGIbeCXDrrBN9iTIwp5g7FOX0M0YA6DaJy
	B3myvTtNk=
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707796285a.6.1795550512823;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
X-Received: by 2002:a05:620a:a11:b0:93f:740f:5a62 with SMTP id af79cd13be357-949bab7d122mr2707788985a.6.1795550512169;
        Tue, 24 Nov 2026 12:01:52 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 21:01:33 +0100
Subject: [PATCH RFC DNM 04/15] soc: qcom: pmic_glink_altmode: Enable
 TBT/USB4 negotiation
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
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-4-a9b45c69cd38@oss.qualcomm.com>
References: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
In-Reply-To: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=1317;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=3/ET7POdT5Pe+t+Zq/yBmXJJgRV/1106W5V/3UIdJRI=;
 b=qv7cILk12lrlqRgI8UZiPG9d9Yieiz5lkd7kkOPhcEJOFVffw1JubNmMvhJFTs5tWJE7etKhH
 eT4plqUe5EJAL6sEKHgE1mFJ/adw3SwYZXmYsinV7VV9tLoCicCt3Zw
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX3v0UILurJ6D+
 5tr3UmAR4OOPqc5El2ZeCoMEbGwphsdVnU+2zzlFfe0IZXFuMWO67m5u9NyohDBl8/eS9CIgCM8
 RnfYLlKY3+ndXWofE6ceA/h86PQVUpf29AtKEVVgNfavii0PZWCUVZ8+fMrFEoR78gn97hTG6Y+
 UVZHe7oNhHnwnHfN0G3mspP+bHK3O92hKBz3KoMQHZ39BLwPNPmiHfVB009UjE9sqTGF2ORzdjW
 pMdTnHNKwyu96yC0Guol6yN9P3uBNtEAyfI5RgbzUP2MDcpxQCmH8QuLA/dANHrgOaroY1dNbPa
 ga5AVWqs5LFaKqsNig1ZUZj1f1wgFdpJirYcdOtdDuaau3J4SUKjMJUGMfbfBsNcmWJJSI18i7v
 bdrTXp7wXW4oJ5xKsNZ7Z63WeTrLI3DYYLA+ZBooQp5IPKfT9T5xR1GL7wmnho6kYolouHLOOwQ
 Ij8+1IetI+o1bf0XESw==
X-Proofpoint-GUID: RgfI67juulL4zzDPao6gW1eUZjo7MDc6
X-Proofpoint-ORIG-GUID: RgfI67juulL4zzDPao6gW1eUZjo7MDc6
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b05ed31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WbklaN51CGUtf8hYuKEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX9UTG2RqBSzoP
 6LlUr5YiUp11mSZEKnrln0bqIZKwVna3XD6dkvlVmoXlHgr1z9hQphqRGnV3qmc0tFZOMehn3mQ
 Zu0eRKqweWPWbzAF+C8Xh84kPstfe34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Now that USB4 is supported, stop identifying as an installer image and
report the default OS type instead. Newer versions of the Glymur SoCCP
firmware require this argument before they enable USB4 tunneling.

[missing W's s-o-b]
[konrad: commit message]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index a8097c54a65559b48f64bfb65a1a4d0d8e033be8..f54d02994eaa96af04c673459b28edd482de37db 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -571,10 +571,9 @@ static void pmic_glink_altmode_enable_worker(struct work_struct *work)
 	struct pmic_glink_altmode *altmode = work_to_altmode(work);
 	int ret;
 
-	/* Set OS to installer for now to restrict USB4/TBT negotiation */
 	ret = pmic_glink_altmode_request(altmode, ALTMODE_PAN_EN,
-					 FIELD_PREP(PAN_EN_VERSION, 1) |
-					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_INSTALLER));
+					 FIELD_PREP(PAN_EN_VERSION, 0) |
+					 FIELD_PREP(PAN_EN_OS_TYPE, PAN_EN_OS_DEFAULT));
 	if (ret)
 		dev_err(altmode->dev, "failed to request altmode notifications: %d\n", ret);
 }

-- 
2.55.0

