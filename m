Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8CB4D9F7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284544; cv=none; b=RDo02wEvxDlenb0CPw8J5CPu+bny1bCThrznSupw4cbVreMh1o4OlXkSv8Q8Zyiad3zirxX8paKfpO+CzyZ/tVrP0S2N7VAyAQSj0tUtwkrm6OpIQGCA2REwkGMZxWQyAd+Gry58SVcqnqgmWY9UgoVivACVheFuQ6PBvjUglW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284544; c=relaxed/simple;
	bh=CUWasxVQrQ3vRZe5x6RDKEwxOSqw5rBQZJxE4EqiLgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crqj1tw/qxlh6osdwJ5ddBUR+RzhuoEcw+L6wmEpDuhm/0UQWclA4qT2oGaoHXLhAxM0HJwJCRyQ83+yPm95O3x8a5P8r38gmKMLR79pDSKbA2aD2k2065SH3AeqbMZuuYCd/0WN1yvY6T1eyNmr11CpnIgDkGut6UYXUJjC20s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTvV6QV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Up9FNJER; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTvV6QV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Up9FNJER"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OIf4xc1675788
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8XTk5v0tefQ530CES22MYlLHvNcAW6UsMK5DSixRlE=; b=BTvV6QV7YdPA2Wlw
	QqIRO6/PYju5u37Vhc3XZ9HOTn06vi8hPuhveajHU6xI0lVYu0SEKbgiSFtBjUkX
	uutwbQK8ZASpYCANq4pCBRSzMLyKa015/uk0X/8QcHyAq5r72dga6uzsIgkj/x0i
	pOd+zhWBFw2BzODwALED3hf3G+C52BkW1Xu3sDOwBm3EcFKomIqlT7JLzEPdZhOe
	JtLvxrx5K/RO0PWeV7JnX77FNwUAoZ71NEan4Y81IejN19HHKW+NFoDRvyplkn6e
	XNAJJaa0lmKr5meQ2WAE9vf73PeAbIvo4KalRueqR3/mYoEt1qVOPoSanmhQYqWk
	QfkRuQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1scasff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 21:15:41 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso481057c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790284541; x=1790889341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L8XTk5v0tefQ530CES22MYlLHvNcAW6UsMK5DSixRlE=;
        b=Up9FNJERnA8HaufR+y/t8TSKUbepGZ0FjOTm5TlSEOrIVBb6jIy99C+ghzbXAIT8Er
         8PA1ejgbPfo7Z2TmirYAL8PNdqE2wEWkdE0kUIfA6QKQSQgQ6WwOx5y7Ew7AbOhhtxxE
         z5ptBwGJo3HIEVReMIbxo937xrnzVUuQAdM3aQZH0r+IhI9tO/Ol8vqSu3x6LcSOJCrK
         +KeTF9cJ+SHWlcWmQ/S1ugLvpeauMlIBCko45mO162nKLkAxXV7r+mztPCnF5B27526I
         NBQS+mcWzmqro8skLLeWw3HFh4NKX2xz08UG28P6xiwpxNesqZgtQCvBBnLQluHPLVmV
         G/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284541; x=1790889341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L8XTk5v0tefQ530CES22MYlLHvNcAW6UsMK5DSixRlE=;
        b=Q2eD32AvmXDeeaX9RvJ8WuGQeUXKCXqc5ut0p0jsN0Q9iQdSOAhlEBfLUFad4itgWb
         Q6gsxVGtN+L4Z14KFtpp4VcPaWVTMfPSEftcTsLPq37XbGbOGAHL7XATRWRMCtWNh+lb
         Yv34A9fGVDndB3ByonHGmcZndSm0vO0srC7okVxgVpq/JRT9wZISipIpC8iHstWk9uVB
         aFOHQ/9OA7wQRI1zjNjhn/oP9cW/2nltFWeNwQSPnhDhkozxWmAWjqcjoIE6u0EVuLIN
         MaRVh/e0BjsJFgmq/VdUTeuU6DrBdTKhoISmNDD5HeiQmfx3gJh6XJcj9QsuhoLwUYQq
         5q2A==
X-Forwarded-Encrypted: i=1; AKwUvBw5HxRT3Wkl7IgocV5e7N/UkvJljXAo6pSZJHWLZP/K82Xdg35ovIntwwTShRYP5NStCPfD6fg4rgeCFKOv@vger.kernel.org
X-Gm-Message-State: AFuF++mN+8VjLOqFyrUIqT1F+xaD/JVqN5e/j8j5deaTvcS+KhfvFxFZ
	J5/yqERmcqTfydAC0juJncmveaLv2TYVOXA08d70inL5YpitKXuuzzcUf+ptcg1kat5atsUTx2W
	3JB5gaArp0QgvdrrikoapUzBryalWzdBLaFfIJggCXtH7zg9+wLiiV/KenmAgYgZ5wZcVJCaC56
	N5
X-Gm-Gg: AYBFou35VoG2TA4SWJpuAdq0H/epBYGdnTMy04+EvUCTQE+QgI5RuPjqk2Bx/I1DrUD
	6gXxQlY09WyRO3hBG4FliSEt4dbtKEGgfus6tn6GASYSRTYm58sNjdFXxNSB8sw/Plzyg4tEcPZ
	PGtFfXp/DkFU0BSKKmdCpG50ki2ADEzlyL032dlnzkQl987/xCW7BL+O8TrfJ38c//pAhRrInMN
	mDqZxb6EQBW8dW+HesVMJFX+GFwoGCndokw22a7o02Ukg9wF7hd5ImMUSoxlOqpYjkwdcibIbV/
	Vz/sQccb12wIejwMCmbIm2h6e4EehHWyDaxPTOyxNMBF3CV+eWgWGTehZutGJAu5GoZGNUN/XAz
	/0XtuscFFWuDbRTzb5h9UPiI=
X-Received: by 2002:a05:701b:4306:10b0:143:5d6f:5532 with SMTP id a92af1059eb24-145040cfd94mr2743801c88.40.1790284540747;
        Thu, 24 Sep 2026 14:15:40 -0700 (PDT)
X-Received: by 2002:a05:701b:4306:10b0:143:5d6f:5532 with SMTP id a92af1059eb24-145040cfd94mr2743773c88.40.1790284540113;
        Thu, 24 Sep 2026 14:15:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc47ab8sm1323776c88.6.2026.09.24.14.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:15:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 02:44:36 +0530
Subject: [PATCH 5/5] arm64: dts: qcom: mahua: Support GPU and GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mahua-gpu-v1-5-0fa0bfd8d315@oss.qualcomm.com>
References: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
In-Reply-To: <20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790284491; l=896;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=zcZQ01STOX/BFxpjfteZ5GbDA/SstCruTcWAzRWOPQw=;
 b=qf5WmuA+flC64cCXlsBjTmkpfQFtpR3zTefYrtkTx4i+d6SPJXuF5PLCJyCt1DKDYV3vIsh2z
 h7RJ86eK1yNCynUS7ywf8obGGXSmuuceWuZ65Z7lQC/seu9JrUHBztx
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: PF3aMEx7AqmT36Q0_ThVo24wYj41SqWU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXxP+oHhhkX+3c
 jYsNrxv8ECOPKWVeqUXbJUzp/jkYz39lRFNu56ri+gADy+WVdsGKUyS1hiPk16yGntrcJ7f88Xz
 dJmgjjOmgEPJepF+ZKLf+dXozOnsPvOuqd1+EiLxuzVJ+uOeaAcf/nP81A6YzT9nicu2v4KKddl
 roL8ZaFnHi2eAD0OGZ+RzK+k6x1jP74QlabeLxgu33qVxjd3l4FcgxcQG6X/Y6QEVikccaftGwC
 5uQMeiRK/M2Uf2JLTT1RUIof7FFiJ9SG251EUZLcSwV373k5qr2mMKTh7wFqLGAKnwhJCGd4FnE
 7j0Yg24PlDnXWswcNyfHgljw/dKm+26kKqd5SBKBTdNybf569n518caB6r4x4yQSAsvO5f5xso/
 +NjwsUi1p8e9F4iM2bzTH/RuYnxbUTYazGDUN+sT38MvPXsBSazsQL6akY+gtDqKOWLezElneLU
 CJWFSiWiVfgxASn53UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX0kegW+HPd064
 PAQrD/po16Zk0LzsVvlYff5+T07qIqy3Mhke1JI/RXuGMSbWYKVDM7OZ9Rd7znZl0514Ecm3gtr
 8h4lGcQf2NFjWyFGWoKGP7NHI3tXvhc=
X-Proofpoint-ORIG-GUID: PF3aMEx7AqmT36Q0_ThVo24wYj41SqWU
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab592fe cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240086

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Mahua SoC has a new GPU called Adreno X2-85, a slightly smaller variant
of the Adreno X2-90 found on glymur. Override the compatible strings to
correctly support it's GPU and GMU.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index a59c5ed7b48e..25b40c33521c 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -127,6 +127,14 @@ &gcc {
 		 <0>;				/* USB4 PHY 2 Max */
 };
 
+&gmu {
+	compatible = "qcom,adreno-gmu-x285.0", "qcom,adreno-gmu";
+};
+
+&gpu {
+	compatible = "qcom,adreno-44060000", "qcom,adreno";
+};
+
 &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };

-- 
2.55.0

