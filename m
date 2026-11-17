Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897288;
	b=1rNw51WLfpTI4IoqQ6GL5ojW5JWpxsH/oKL8heMy+ivpYjB1idh2uJq20i0hcb1Ls8dG
	 w6jMn1zHz7s6XnPlQyp3gekDTZ7XZeTi1M6BAFvR/OCQnhNAXYgMz7D8oieONmLpoPzNp
	 fTa+dKS2fX7/4jsoODunK+64FTCmoCdU5nVsJqxBw7ySVEPx9cgEZjtX6emjvrFIrQ4NU
	 uXKBgjgDpndd2yKjq7/t+XFW3jQhrjVH1ut7Dr7MPl56tGhUgjL5im7HkMXNZ83rpL1gF
	 kmE/Zk8Gbk/0nIxX5GHLkbFzPeZPyLgI2pQF1ixYcgFijUHIezF0lpSIU6jbWEFT18g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897288;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
	b=YuBY2sMaK8lFLXhMUMrJ6keH0JmbuhXdalmh7JyX/dPmwbZBW3Iw/VZXKRQByPTCtpYY
	 0g/goMsETnv2QUpjq5SAfIJ99q6G1kMBm2uXrqTZWnDIWGUHeqBMet4QquthrTZIxZoMq
	 IJDHPVzbVjkD+GOSMBkOEOyQq4OSJXzUKiAP2IA2/jAER3fERlwYnCpxggq+wXml2+U6b
	 OJXYPh1PSQa0lqWCqu8NL7yfXwGTIy681OcqTm/5aEo5Cb14bjNjbCnMfG2zJVQq9SMmc
	 zIAJDjftzwX8EJhhOa58M3PQgoHWnFx2t842nJ9KhanC142SpnReVg5PLWhzaUkzKnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="EHT/l+iu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E39C606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E39C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hplfNUYI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EHT/l+iu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aF5l4146671
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=; b=hplfNUYIrkS5lLFO
	ikP7yKjU66vTaAm9iesw1Yn8ux1tqMu+ZSv9YcI43bs+11n6DH/h7euySh5E3MPr
	kyPzPP1WdIqOJTuFuUEVAnlzODtvdEn6tLeBjPlqwzf7Ha+Vr8qKhMNjARJPOWcc
	qmKxyTtTYh1ljlXBl7fxqr0cEJz8mjs7VuQAm2pOm3NatvpqAIutMOkBzTmvfIyz
	QFsM4VjfsA9W3e4HFCG4bZAeiu9TY49vUb+HLl+PdxKIb7ZsgTM9Yg7biagtVLMY
	JJVXwxpthZfjZRi3dxJ7JI/oJtK7BRqkZHR2M2Pgjn5jodvWIenjz07fj2kMYiBE
	LvqjcQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfm3wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:34:46 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso2357910a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897286; x=1795502086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=EHT/l+iu+SZXxyMHDBkMtd9B/5T5IWFGdC/0Uo2DdRE7xTF/lEa6ZGJZWoz3C0QVyy
         hKnfx4yuUNBKK57xr9n0QnjCn/Yx7GxZ82fbppN8oNmXOdDuPLr/spgxzsUppWEfdfvV
         elQ7tkiQCEpf76fksEmgHA6YMHrkU3wIXua0o0Z50GYIFOzKoTIBRIGh+J4nC4yB0aCl
         BopjzVktMawC1+Qq3VUmtEqRekr7gjvqFq6bHk8zkBtZb+EIpNCRv7Wg3rK7xeGiNZnM
         zWanBt/DQ5KfZNBPAV/CAjW378en9l2GkfdTiRlgCk32RyolzVOARdD7hBVJCExO0yFp
         bN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897286; x=1795502086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPvc2pJmj3uvOPPQhbVmgAKXLpjRqYT7Sq42BxhEfNc=;
        b=huZUx/l+Kq7xhGziA7vrNkL3PTw+5f7BCYisORZ5MazygAND3456B5Z4u4BPcZm9yZ
         P4IQrjHTq0KWdapx7bifiUqyernn3Whj7FWMs/cxznOHP3n6OdLn+MCAwTqf0iuJ0dkL
         40NEWWq9yRNXe7Xd8YhvV2mG7lNdAf1l4Jfy/lP7WUNhbUzEwYVA6olYP+kUEN/o+kNl
         i/rEhwG0yUWX27Zfa33yRJMqY8/6VDflBGxqjxh8XTP6d4lJARbThiIofdUBlJlXCtSa
         IzKeJ+iCJ8T1nGiaw/5lF6HoD7HC4bct7VaYwFaKr8SdOAOFzmCtqClcjUZb8/jbIRQm
         2VmA==
X-Gm-Message-State: APuU4Z9ouERRFV0aYvxKASsWawfBW5tU1zQZ3ebvCOduyMCDjLoM6jhM
	2lhvauYqZOKPLtDyinrk0PcV+/ltz98QykDqNQHxr3s2QVceGtbtaq9VcZkomGkpIU0l+gSVXqR
	xhYFFKXGY1ZA8KMQyAEQv2zxeS3pKCVqpq8dgFt6tI2KPo72gbEDjHEdslrvLda0dVEBI
X-Gm-Gg: AYBFou2z7pqhiMCanxHP+MvuGN0Xovyp+MfzrFvnYFmqpRbXQnEAyUB/W5KlH5NBZbT
	M559VDXZygW7hM9c0neJeK/80RI4SF2BWPGjxTOCrb7jucoGohGuFZA780OgApPP1byULYCWY/D
	D1AVr8gis//Vg2VyMATuwvoAGh6Xj4dh9SIQRBrwZU4xTzcv+/cA/z5rkRboxnHc398l9jzCMK5
	+Dt+VDuKlnhW+bb3RFz7C6LWZFU+Fn9ObjJUqBqJ+YvkVLjnrlSlu++RBfvkIFhDDZxyEO2vMrx
	LI8BOi7//fD16lPHnkvNOKnYs/Dr9tEU+EYblPVOsFbATezBFcjRqCxk2ENbUA43CNEkkyqT+T9
	QFHYXUxoia8WK3qYI4WIZrpUuQEvLzHfl/0GPiI2+dePRIs/3tHvbJrYe9GTkz4eWhzNnVFvI9F
	qvRQnTobt68kh5gq1bPe5cruOOiOVucapLVmbrcyoEZaRRVjy1
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380198637.57.1794897285535;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
X-Received: by 2002:a05:6a20:2591:b0:3e2:86b6:9bed with SMTP id adf61e73a8af0-3f7a81ba72amr12380168637.57.1794897285029;
        Mon, 16 Nov 2026 22:34:45 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:44 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:34:30 +0800
Subject: [PATCH v3 1/5] dt-bindings: media: qcom,sm8550-iris: Document
 Eliza IRIS accelerator
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
Message-Id: <20261117-add_iris_for_eliza-v3-1-02a55a9272ef@oss.qualcomm.com>
References: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
In-Reply-To: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1458;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ERwzmO8/pMXME2fZDOM0QI60W9iJpQBHJoJKsOsmInk=;
 b=QeYf3Y9llgzNBkc11s6iVXzSN2QcXuqIUobXrnbe8UUkztWuA92wv1c2DE4TppWmTfDYWJFak
 xkN0cNUbYisBG1ws1TRrhH5x/9E/iGAZTypg8jhwGFBgX1JzFTTosX5
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afbf586 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Sm_iIEVIus1u_0tAx5AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX/Lk0F2bWe54R
 lEqDH/UVo+b1oxjshFkFG47tBONFkPLG95itwjIwnPa3kBgNmBF62+ZTNLenF2WVvwa/fu8AQFX
 xLZQaszN65whT2PDfLtuWuAT60sSXEA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX4wxFh8KRsAsl
 frJa4+RmmfjXRxnhcD4GTYGScAQEzRwgwiJxNmH2tU4IOfgqjjTZA0uk82dL7WRTHfND9LDr/xZ
 B4TV2JsG9aeKSIkMTaCexegrSeFM2xS8FcBuCts8IVDt8SYPW9w5+Qw0byP7juevPCYZ59T6Uyp
 IvQEUzBTCoQkDMHy2wcsENqdse7OoB3B0D/Kjp9W/+Yt2WyuvMh2PmOKKu9IcEgTR+3KFnI+n+R
 84lVzP89f/JI6d9RFuzFqUMLINw8laUtuvdDACsxAIg8ULbqeExko6gUw7eMWv9I1ZNGwCwHTgI
 Mo+Ljem9DVwhzdGgZLY+M7lxxOMFgS9Ub5i7g8exCfQBoW9mViZW0vFpMfUf8ekmSVNuzqAHqcc
 dHGTrxcU7MgtyLaF5sOXbzjSgOb50vT1571cg6X+H7H3ZP/SNoiu8vfEi+HMTGVbylUx3EusivQ
 7//8ja/KlbrvMnv2Gow==
X-Proofpoint-ORIG-GUID: W4E6Uvw34QUrUs4mLR9_EX5f-TTigQVu
X-Proofpoint-GUID: W4E6Uvw34QUrUs4mLR9_EX5f-TTigQVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
accelerator found on the Eliza platform.

Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
VPU3.3 with an SM8650-compatible clock and reset configuration. Like
SM8650, it requires the bus, xo, and core resets, so include it in the
existing allOf constraint that enforces resets minItems: 3.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..e06f2d844bd2614f6bc5237e3a246056daf28821 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,x1e80100-iris
           - const: qcom,sm8550-iris
       - enum:
+          - qcom,eliza-iris
           - qcom,qcs8300-iris
           - qcom,sm8550-iris
           - qcom,sm8650-iris
@@ -106,6 +107,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,eliza-iris
             - qcom,sm8650-iris
     then:
       properties:

-- 
2.43.0

