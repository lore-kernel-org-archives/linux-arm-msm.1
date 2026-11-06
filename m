Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972694;
	b=w4tnOYXMQwpWvLBvAObraopAgEgC1mp5tzO6ONdgHFQIfM919dOE9WJWuu3OzGWuxjCx
	 QDO8ONQHKk91uCY/sQFYphVn/q4WhNNmdmnp5OivURSnmF6IGGWjHyIEx6/ceF1mckg68
	 ubRyJUaMSsp5w/y7vtTP5+eIcKHmQ93NULfTj3DWDxre/jcMH/FwE1ufWjJiJjjaMLNE3
	 WgcXz/FE4l1gRxTv3L45K+TdCjJxpE15CYWlof/BSSchxI15oBLXQ97Olq0m/Sfr4WCFw
	 xOYzXFGAaVpY6lGSb7l5Fb+/4/LxdIbfoxZAizokpspOEqV5xMigrgoHMuEHhF6enxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
	b=zel5/aaKdMlvPWegZAgWnp25okKdKj4u8fWgxccCNZM71laGEGly4MmebyOUg58W2MSw
	 CbYd4JxF63Ic0PSIVYbeG4edDHjHVY8bkFOYqaumH1qmQkdbJvOXZVWxwG8lFEZNkPTrz
	 EXsaxbClLRvwFjmrS/XiA4ECqD2QITCgRtQhMvUiB/hb/reTJrcD9ZMGY7ekOsFd5fT+3
	 1WBXnl1Ts8BQOqgIrc1abwljeb6qginf8o0DMcObd0qKnuMbwsHb115Pg4CiyM8GOXjuI
	 Gr/kniDeymKINfTK8d2c6f0OzCkep0tCys4pscAxDzEgeQI3bo/nvAVc92p1MsvmWJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kWjrqTBg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdUHqTsg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63695608360D
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63695608360D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kWjrqTBg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cdUHqTsg
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APPHc527836
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=; b=kWjrqTBgogdaHeUL
	sEZfG7dvzXh3zIWl1p/IilIITI1lE7uLTWgz38momuwDYjDjNXzWWyCPDeSp+AOk
	lQvLWzgGYr3ZJW1UidMfrHgtGODYKv+R7WxX+Y7yqAfDuZtEk5wI8Vp8cz0bPL59
	wDP0h/W0QGeiTO9KWVskOGjQxdP8obWIhc9g2tNK+Wq91BEPCbljudWYvwPKyU9H
	kHAG6nBiVx9/oeVnBbJJsxpk2aaBn0jOmLBsjXEvkrj4uPcVE0f35UF45jELtkhh
	pxpDZKp5xFZI6aaqyvbXInPncRgbseb2YszsBVse7pPGRTnkNCYjEuy+AOOHVqhw
	UcdvFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u05k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:44:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so131578285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972693; x=1794577493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
        b=cdUHqTsgnkgbCxjtfGyIRIBlscQRXr/4VETE6SyX3VVINGuvsYigfINOQ3G/DDwqaK
         olbC7j1vcAb8z+bIqOp1T/WZhsRu6lC0FGjisIwTtlkz7kR8PhuFXj7jhe5Guqle272/
         z7ofSlhx/bMFsSp0+ideQJcx8TXHfFw9ccXTy3+TKzCZShBL96T8XV+Y9CGgq36iok7i
         gQp07OXHHCQMNgeIeWLe5GUUMK/lsbc7NbEdlwUbqDuBmEw4sAvHI8xXKreLPW8Sp4W3
         EylgcckOKfl2NmifOGuo7C18xK3qW0dbxwh17x3pPvsN9ea3fNeHOf6EGwF+UYWYz+C1
         Ud/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972693; x=1794577493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KFMOrkADVP+8BGFWWz5DwK17BKn+/vVaPVTQ4G5cEjo=;
        b=EVPnGP4D2egDKgEEOhvl1Ea90Z90+Dp6Zmgz9Lq0iRxeIdpjJ6/oeGjBHl45geReAn
         fIcx9FAsjGF/gklhEsq4CIWSxHfetqrkZU2yDWKQ/lWo8ClWlXIDx3xlQ6vEBm0DV2ht
         leiZDuiCBGsx3qXrBJAsytCgWr1rnMedNLFa6NhNffcrVzsTGgxBhZtlcA+a/FWDS307
         JPS74cQHe0lmL6okzhbC3H5Curk6IXfxyQMR92IEV7Ry4/aDZrN1UlMIaYUdGxF9UmwM
         HCFztwZ2XD1Ke5wOkDos6SPVYXDwbMGwc6L/2L4UJhAGVtCuQkW3kRxkoHQxaohyfR3y
         nonw==
X-Gm-Message-State: APuU4Z9XvaCnPlYMboeTqrES0nA5Qxcc52fR//qGQzJ+V1gKzfsRJ0wd
	jyLMgxPOm+S29d7+3iUnlD3XO/wko9YKhKKfMN6u/s6EcZHeLPqBiIYU0t7KynuCgQr0pAK3rSm
	T+yG4/hHuSmWDEDYCodPhkXKDerYmtpFT+LAP1PpCbyRdxOxZicmUAMT9yZRifAZWGXkH
X-Gm-Gg: AYBFou1M65O41IPavjmechqnEJa3m17kzoLJMrTxHJGVWR5l5is6KVbw5Z4MG2j3LLC
	dA7yR8wHye8eIRhQRSs5ixpD4kcIsu6sJbmNO7PDsCFb3hzzxP2F6snEeWlOBd1CjgUi/wDnoEd
	/ti71mptL/iGPzqnKhsChYn5s0fCLMGgLT1THSEIso5imY0t5oPzuNZcWKRYoX/M2/0OCcLUD3k
	QiGE3iz3AUbBWCTbvEgc0L8azzKwzEOx4mAhIvoZ39K1b4r16lE8qB6x2IljbfaEecqskjEjGRB
	0oCO35l4cHNbcGZryPGJNlMLHNu+UoQZKYmI2BeQvVKR72ShFUYFJZntOyJai2/QlRoTFiNveP8
	Ai+cTZxePXQsi3FFeJX7GNPv/BZB/oltGadcBiSiL7ZzpaLbMeH+iwyP9OIzbqd5W71i42ZGLeX
	ExXGcwpr/9R2Kkvmn9QfQlEFpHZDDV6dBJmmPRayGyDXUiJgoENSfxKzmcrFxU9g==
X-Received: by 2002:a05:620a:4107:b0:93e:d364:c9ee with SMTP id af79cd13be357-945f35650e8mr365627885a.74.1793972692551;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:93e:d364:c9ee with SMTP id af79cd13be357-945f35650e8mr365622185a.74.1793972692010;
        Fri, 06 Nov 2026 05:44:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c003055a5csm382747e87.13.2026.11.06.05.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:44:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 15:44:14 +0200
Subject: [PATCH v2 8/8] media: qcom: iris: describe QC10C as P030 (TP10)
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
Message-Id: <20261106-ubwc-format-docs-v2-8-82949f88f030@oss.qualcomm.com>
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1055;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iqfuEamj2XlYNE5hnAH8AT8Abj9VyJ9jbobRw0cnh4U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq7dm+CuAs9qhMdIEzhgPgtp3QrLIHoNoaQQRqo
 5AS3EfM2waJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCau3ZvgAKCRCLPIo+Aiko
 1dACB/9wA5t9MLN7WDxdbjgtqULBKGm0SpbExAmy9p6mSMbiTO8Le6urnKTjbKIOZ7ASp+GT6Xb
 9tp9oF3nSmHKUuPJVN62rnCYy/aCCQf6kQNRbs+DGOtdl2JYO5oAz2be+16k2a4HQ4jYknMmt6d
 jWUmU94ZXRhvL+VmecHbdAomLNoe0edTG1B2hGpkrdCqOjliSumqwgR3VnadosCpLd5yUZRsHfB
 QDmfQpLALm+DQiBohVvSnl3WAKBEoE/uzWuUzeQqwKaAh5ST8z5n92RMp49LL+feneDBClJ0+F3
 H6QXQd0qaxqniymZG2q+iw8NRfjarePkUshiri/P0SLz5Rtu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX6O31PREd7QMp
 FXl4vr47a/NtQSFC6J8hTnPbIKXdsMq4QkqKFGwDvW2nF/s9wve0Cb8x29G54lAVYJka/aQ80gD
 m9q+MHmTOq4geg1/uJsEinQ/PFv/yFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfXz3pctEuBmg4w
 4CwNxodVfrjo56+y4lPJDg1VIGjT8VabmSqpdMePtDjsyx4XXd7Fyp4VkEgKNNdyNVsa2Nwu/1a
 4Aaa6jIva+VuczBVLI1WReiGRN++3hDZttKK8LGJK65OZzosh+W20EuAs8YTToY5v1sPqweE/Yv
 lV0tNpkhvzzNSRzGN+SnBP0bfWSHgvyM6lc8aHrhiSsK8pK6cDojlPAZQYikizJLr9Q5npiBS1/
 +2hwBrkxbcdMD26tmp1MplD8Bbv+tWysX7ltlNb4Db2tOKs7N9ajDT6vSs7anuXj73aKd6jAm2c
 Z3qR4qwte9NeJ1iPgow3tS7C4gbqjxkkWWsHU4pr0kdBYp4J0jT42r+568V2YPpMqwj0D6Ih7Le
 ag8J+Q08cop5xtT04+DsvYuzaJZj1OJ6RzTPn33r677QiBZLw5Uq6zURagGQ0D/ahXz8Lr/Dcdw
 SjY4Xo3mShT/ErwmrCg==
X-Proofpoint-ORIG-GUID: _1xDAHeur9wsUsOhpUNutStDidPKPFqC
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aedd9d5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=w2mF-G9HTFYObF59u-MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _1xDAHeur9wsUsOhpUNutStDidPKPFqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

The comment describing the QC10C buffer layout calls it a compressed
P010. It is not: P010 stores each sample in 16 bits, QC10C packs three
10-bit samples in each 32-bit word, which is P030 (TP10) and what the
stride computed below (width * 4 / 3) assumes. Name the format correctly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..19a984d2ff3b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
 
 /*
  * QC10C:
- * UBWC-compressed format for P010.
+ * UBWC-compressed P030 (TP10), YUV 4:2:0, three 10 bit samples in 32 bits.
  * Contains 4 planes in the following order -
  * (A) Y_Meta_Plane
  * (B) Y_UBWC_Plane

-- 
2.47.3

