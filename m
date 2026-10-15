Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA24ED199
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054745; cv=none; b=ct4fSdXB4gYK7RNH9LIoJLLi2v+bxho6hYjsx9e3pJcKqPngto03Z8eCWtTnGZZiRQy4EdgeX66yu8f0sSQIptGGyCGFInQyhF2ZlK0wePnlny7qP8RQ+3SWmIvNFEg71Mg1VAkesIsKDPTUYVioNHbOVZXa1ofXpxAP8ZwieAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054745; c=relaxed/simple;
	bh=CinbcOsRrU+weX/x8DlHfWVx496vQyqNGyiZd765C8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J+vIsEKQI3fu7UZu6fbwx1yR25hWhGO7SmOLpbtaonjIUkROgTu5MB5M839IzQQmtMR79kCKd4Oqn0HAciekfUgRm7lPjw3wQnHFLB3AkI7gCb7FX9/lNUIE0/u3IIu8NYrCTaDuPMfNHEtqLvozBXasa2WE27+p9Ah4+IJFgBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGifCXtR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hju/0/LF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGifCXtR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hju/0/LF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F71skn2122209
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=; b=RGifCXtRCpX4F8XA
	ls0qBNylzApN/IOMej4NbtlqZIwB564QEKM9L62Lm+hEkjBplJA8aBEpBiJ8hVj5
	/LvJXWrPZE6q6QgzusbZ8WVYhBhpfrUmuX5HiuBYb/gyblPNst1XXhC29/OjnbwQ
	dIlhBXWyeVtHeFT0EFPVi259KbSFsBr5u7sOTYTXVPyS/Nqaikt72YijSSiRAIet
	VfuBB4db5E5RZBBpZpQHaoVVLjW9PabNIK32s4JAXcyaBbLQZFmFm2qKvZCo9Gex
	XVMRg2oG2RSjdGiayJ7x8v8jd/YinnFtvfUj1bYseyuK7kzTn+IvyFAlIh9FFFOW
	f9MKfg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1uqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:59:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b8c60c550so94898156d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054739; x=1792659539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=;
        b=Hju/0/LFuiiGAyyu5GFA1OywyD9sfF8ajdH5eoQf67zLfaal4YImfuOpboo60LkPU8
         ELif3udRZ9laH1H63DEPSU4RBCtTPomBTCFnnTyuCElSvfGhFZWr6I+wd5wHLxlWJ6YD
         d2s31+KbOhE6BUpUx9+vln4brCEtyFq3cRwwmz2ySgmLo9hlxh1Q91+TtdUqVRO6sZ2x
         ojmFUq38fG8BTh9laEv9lUuhswSayHUrTTWKxxAPl/ofFF64AtnJQPgU5F2xMhSyz3qj
         LvVwUyRY8NNCiWTFG+zZOdkQ//xrnkqmDExTDxPrLw/wQSOHXNBgc6PVPU1+v0BppO6k
         FfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054739; x=1792659539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LN0Xc1GnQ+eoesbLJfJ1izlXw7BTBBPuCXZd6buDINk=;
        b=v5rulKt3pBCJv2G7u+GcgYyR2H5XDF0T/E7zMQm+zR4C3R3ddJHf+XS3tkpXGMvUCT
         UUlXBOY+wQ+YI2AdXdEHTgydl2yx3KLDSY0AxNi70KQIskcubuUEVg2DbhZ7ilV40+Uf
         YdKDW2jY8Q8ZkS03XPHqOak3/DXbS3Bg/XlvFHavkXi1B8Np+QFT90qyJ0/NsZtDK3hg
         7EJJJou6rnvD24zzqURJ9AYCUtqWLPXkfpW5J1+49eIKDIigtvGPhEsJ+/7AGpr2dak4
         ozq7dgZMzGwuhmuIPUWbcAtoVJS9uM+0QIGiR9AKhQSiLbRFoaUyj39JPLT5ZbDn8aw5
         1qgA==
X-Gm-Message-State: AFq9FYLSIWHQOrHFUBd/G9wh5ZO2+ZqJr75fob6fDowy+De+I/DQKYud
	5qylA9zXeb0ApuEo4/o3znj0p4E9CP1jPF8O8RRw2DQBbiaQd3OIn96qUsEMMhYdWacloyHvvkK
	sH60grkMH+npeu8yb3uB00lGBCJQT+oMzzEUFU9l2LptJezE+6j0FSVTE/4LwojAm5FKH
X-Gm-Gg: AYBFou1O5FDkOssaAPqek/f+BpGLaJxzSz7+nHz6VaxczTpRt8PMOKalboQ4zZ6Cvon
	jQvyKPM0EuKYPhcPCZ2nTpMqEy24nhhLBggd10M2aYg+NnHi5k2Fa8ng1oGAk5jwmk6Kez4VvGg
	wKUtR1J3ClGWhCQy/B/v/XzbFOmgVnafNgTVSv1RabHX4gQ6lw+h3WAb2lQ8WFD5upPz8mqkr/5
	d5OUX1uCVZAc1/jV1RDxjdotowoUh5Spe8mdenmkF397WgmgKJALF2Wme6PWyMCSomdJyrig5bA
	0EPDDA/p/d+N4m7AgdL4+C8pD+cA+4T5CLQwFb6GgruZbVjnrORRRp0ama3U6daElPvbEtVd2fg
	siY/tIf4wHx21qv7plxbytMxUAf7xWhTiuplizxlUPSLbCFd9GQ29mwOmDVcLhoQcg1VQs6Ka7c
	eoTbU9jJeUmDoV
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr3005237185a.31.1792054739213;
        Thu, 15 Oct 2026 01:58:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4411:b0:93e:7ec5:2d65 with SMTP id af79cd13be357-93ebd20b8f0mr3005234985a.31.1792054738671;
        Thu, 15 Oct 2026 01:58:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be3b51fd1dsm371590e87.58.2026.10.15.01.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:58:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:58:41 +0300
Subject: [PATCH 4/9] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8150-display-card-v1-4-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
In-Reply-To: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CinbcOsRrU+weX/x8DlHfWVx496vQyqNGyiZd765C8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq0JXEzPl3ITzxisJqsyw4t0pMlSYPsdLWHMBT5
 voOcnO3kOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatCVxAAKCRCLPIo+Aiko
 1eF5B/9YLyJIm841SYHHx7rwcbc4xMrNlKQYxSlfc3LF159sdBscm4twCToMomUy2BcBEVMFUtC
 mdoa1ukOkMfZz5w/HKjj1PmtFbnLx/D3Bu93+giW3zgS6l2EwH+qUkGwFJLvkq9SFQ38TlRm455
 0Y/gSXgT19PSELm2mrxTbo+uaxIfBzJyygKhU9NiJpiCAzWLItkY3dSyIgc/joHWGNyfQatevW0
 w7F9C7B5MM/1cl9cVnPq+OHUZA53YXzXZN0Hnut1G2pCe/7ffN+9sSQvhddiU3EJEp9EfiNxeu6
 jb30K+1QwSzPiVqd3KR10oY9QwWmyp9OaUlg5gsPtE1jqJl2
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX+xPOIO7bcTZh
 RvAEj2H4Ue6C8w3A2ftq4K+7KTKMTym07d0qQg84l4A7mCfZ9YwFXMWt/muSaCq9bWu0UGQgpP9
 yuvnemoju5i/TEoTDR3aFSQpi+nJEgFsL0DlYW01Ds+TLvyYh3PlvFPmZ38k0xlxaj+OO8brjNv
 KC+FAShu0l4hRKArynrSPAnUG8pwYQbVHJSDTqyNpdUXWUDRQiiOspqn2vB0Lm2SMDKjaz/cGnl
 N2Fn6zaz8QYpt9+sgeYucKGtKwGeb91SXc3bRdDLI2YmnzVftLYtr0Vy60UhRvJtLVo+UGTN2Z4
 IHI2uhqeWrBaHgbZGHkpNqkmzIdVTtCjJiVJwSyvTVPVdu8JJJG3iIL0LB5jOFjoLg3eJZWoZjL
 7iR3LtsI6fclfejx9vaKPvWtD8GnTsWi3awE7xxbMdoPZRJzSi9hlqP1qpYe/sexzomM/w6WyAi
 qusPN1uT2ef+XOHiLTQ==
X-Proofpoint-GUID: VBhgTPDW9_hS5kWS58FkYaoi0Vr-bKPA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX8XxcxXxUTPwh
 8bWv0cHHiBKR5pTyy9ZAkpI6RPHnxKnuoFcErLdnUPVttq+Vb+kQt/bdYQswasrjTaD2Gk8E4bE
 tJnJeY8V5XilVRxh1PYmzPvg8v2vnCo=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad095d4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=l4xqpnzKx15mTiSKZogA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: VBhgTPDW9_hS5kWS58FkYaoi0Vr-bKPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150035

Allow the LCDB regulator block as a child of the SPMI PMIC node.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..1894fd82cbda 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -171,6 +171,10 @@ patternProperties:
     type: object
     $ref: /schemas/input/qcom,spmi-haptics.yaml#
 
+  "^lcdb@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,pm8150l-lcdb.yaml#
+
   "^led-controller@[0-9a-f]+$":
     type: object
     $ref: /schemas/leds/qcom,spmi-flash-led.yaml#

-- 
2.47.3

