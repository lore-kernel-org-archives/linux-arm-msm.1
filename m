Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870EE40F8F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220543; cv=none; b=GHNwy6FTh+fvCExK008aouPx4kqWtwc5rfrA9MNxt1B1laBSJRtlxegLUi2/ed8Rpw5IOx930zfJjOgKz7eJVOFhz19CJU/pYN+WSrZcGvPeybEEoOlvJydNwZ9g3dEq5ekw2BmBOEgZ1A6S23VpEg8Ne96icZehG/fQ+Rr+hf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220543; c=relaxed/simple;
	bh=dLbMaN47UX2yctcmdOJcBIj7MyMzJ40VIZ60fAiwd7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q0pvzFO89Qsf0Qfn5h3iMl4EBP1edYTeU7jIQeyxzhYpOgK4ZZ294pkUTe3pEbnP4B76nQaainCgcHaDIh5gFfE+pJfJkspBzqo3e+sxkIKiWBu4GVVzAI6td+iwSMGlQEQcWM3x1/4/eG+i7ZACILFqF5QF26ioAII9niGsbbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPXqjClR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AudiQl4U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPXqjClR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AudiQl4U"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6nGOM3732561
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjUB+2v4316ihTt4ykzPK7z9CnqpJvsFKKbJ2C5C+9M=; b=OPXqjClR5VJaB5Im
	yyhVeubFfO5w3XErlm7oLQ+kf2yJb7YYB250nPEZfFokBQC4wtc0jV6XYwZERD2S
	cOpp/TwZ5lQ+IH7iodYqVsvPA0wb6qN5W+Z+v/x0aFYibHhASTSzShAXAJrzmX+t
	G3Jb0fMGstqYdEouawVlcCRdOms+Y8ndiTzAsnlgwRMc2zqS1Hm49E6kVc/yJRSw
	zeRViwVmRoON4xJlHmAvBnFSwwY9KQUDJhftbKKyB89RANcSHSGATZcDMWtTAqRn
	iqZmNY+3FH6MAEgN6LQHpC/894+C8J2bGqkPJ61GPRF7Vpd4O4xxksCd/tlLGBcT
	5vgacA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vn88rcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 10:08:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b6bdcb4fso297153485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220529; x=1787825329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjUB+2v4316ihTt4ykzPK7z9CnqpJvsFKKbJ2C5C+9M=;
        b=AudiQl4UYBo285GtGF7BbgGcdBdb/TaoL/7ra9HXaXTgAdweGUBsM6ljtv1V2BHKYd
         T6jpEjjYa8TK/OSb8QGkYM1VtaBjmLuH8Z7Q5GoEO1kjjltX8noxRH48Hv67bfe6UCg4
         NzkhJP+49rWQjxQFvrsbfu8sEkdZovnvVKvpWgRzxdPwpGiJltXdNcHcY/Oa169xn/Gf
         yGeXW/1bTIK6odoK7rN81J2KcYVmn3xkZrcX78Mt/bt/7/dvqUcBJIGlxgcEJ04WHwE9
         J0s0XiJAKC6MGXnCvgDXOlqQpzBt0j+BoHdQ84NkeLXb9wq72IBqog5OSvmkBkKR0/Xb
         PuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220529; x=1787825329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjUB+2v4316ihTt4ykzPK7z9CnqpJvsFKKbJ2C5C+9M=;
        b=lZkfPOrho/0X2wpRk40nuGOvdUrnX076YcM6qydrRni8oufx2ER2uiDwvMtd/SSW39
         /VNW0JFBQOe4Rdu8x6VaZC04RyKprPqgQti77c+V2cY6VP1Sx1555nx94+HIMePyYKUg
         +OQxAUhei72VelFV3d86lUbvxo8gEZOHGJmrG4PgVhtXkIp28uXff8YOEk/jcGOsJzn3
         4F7Xe51CThnZ9QxRerF6q/JlJ111QRn/Dcvj4ZeabwQr0spouElpm3wU5rf4VskQMpNQ
         TkSWWWTnNGSl+R1nmjpaCkEemqdbX16QVei15Toh/TP48c7IRMyT2p2dvMBqL1+Getqd
         cEqQ==
X-Gm-Message-State: AOJu0Yy//BwFPUcyii3KUbM4xHf55mXK3F6XyWG7Z/WtOK2RMlE9GP66
	yQhr929MkvUrQ9Q2NSlfCk7W7OI4BddzxHWPtlDppPgzbjjRz3xzpJPS7sBMyMo6diocVTlBtgi
	ilrgzHvdV7EJ4MrvSyFVY1GYu3VZr61EkC73skwcTWeRF/Sh8lqA1RamtwqV5IRPwlkG0
X-Gm-Gg: AR+sD12Y0W1npCYKIv3JVe+x9AjTmpjo7RuRlaXm5iMOkLFlnA0klgrDbp936cbmNAk
	pBnWF+dnAZOwPCXC4H97CvKSxBFT7DGsgkqQabA25v1s/3XukwK2Ufnrw6cTVZXvohXmXR8xMNk
	AaTqyQ/PSOyJnCKL8Ssl8EnU+egFx4GmYXunZ1y3oIBN36mM7n8LzuZZe6eCuTmf83z9JMfEzu6
	3nvE5XPSTnFS+/HJ/mYtOZLzTn+PPL+UhFfm5qFBiQ5gMtADErGyBMsx7E+ngyuVo6rZIEgkoZ/
	Pgkro/LrMwG/DBb81TWN/y9Se3cEjrgv2EX8PXf1niJZYcBeSTxujwskfjFNK39NUdA4D+NvWI1
	KzOD3NPC2
X-Received: by 2002:a05:620a:44d3:b0:92f:362:8097 with SMTP id af79cd13be357-9371e1f72e9mr1071342885a.8.1787220528906;
        Thu, 20 Aug 2026 03:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:92f:362:8097 with SMTP id af79cd13be357-9371e1f72e9mr1071336485a.8.1787220528370;
        Thu, 20 Aug 2026 03:08:48 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:46 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:08 +0300
Subject: [PATCH v2 05/16] clk: qcom: gcc-sm8650: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-5-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dLbMaN47UX2yctcmdOJcBIj7MyMzJ40VIZ60fAiwd7w=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHrrP0fCoOUyhPmloP+ZsCzeZZ4tAFrKFid0
 xk6qBvNQ1eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR6wAKCRAbX0TJAJUV
 VgElD/9DPPKb7LBh2E2dvZafVJXaNh6cQ+2ffvGEzi4w1ZquTJDguH6YgmO1gw9UBhlBIftZNYi
 oCTCM/a4BfSrTNosEhRNlUO+wdx0iUl1EHdQWJHvMgAVKSJXYLhMjDxRI82CaoykuPBiozWsjtI
 hhxagkRO1J8CgwsDyoqoDbAQ4JsZiqW0y1CDOwVT+sGrjYJN945zlNFB9IkW54A2xguA9YdnpLm
 P5A8rsdCvn9ebaxrRGKOlWMGd14+5xelowafPaTJC6Fk1T7SeCP9pYA9ksHE4Yz9Nk3KEOL2RZj
 nvhtabk0KTOVyVEG9DqWdg6Brwz7QCWunudJLIDsouvNEJ4jWXl9dMt8Gs2yO8SMOQKiQuAQ0Rv
 vpXwzGwJPpL2IhWv755cvmOMnJlBGSTiuPVSIzUw4ZwWCbd+C8YTMmOfXeljBfrM4FpPgSktJvk
 n8bhiq53ab3IlZpITkvwQ0XU8m9yYwXvpqCWFvuIMp977WGvtZiUqA29j1DBcesVw8zv1s76asH
 ovSu6zdGKq9hEI9YEKHIw96c2JgCZy/i0CMQ7mLWk+MMsdmamTxkKvmv8VktPZ+AevKqoBxBLBi
 xytcYPketgM26Q45a2rptRBFkZ1Ey8IMdzCyPv4gM2O4yVA2nI6CEESIHT/cjH7YxuK2xbhIJOT
 9jNqxsyiSQFhzFg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXwdBxOoWb64op
 5cqZMvGfCYc7AZtx1yeaYKqpYj8c5NKxKuoWHwZ1kHaSZ4EPlkst7cJFU5qpSzCzXwVVqaLNUN9
 rsCfpUnBSY4ZubHkWKX5eH1IBp3SPYXUzAKA3nUJRinrkqFFqk/lWatPQULDSSgoQnqYqAegc5o
 Ip/+LZEApeZ2W/ebiXYky8DCuq048PnsgWuJ8DWw/SBG6Rnbvd4Az7vvKYJ/qarpYApqKhwFkqe
 oITo6qt1i06l1ZBzRhf3TynJ/pUoFyWQsYdfbZ52X1cB+Ztzs83pzzIsxWjkUiqmSEGDke8vQrZ
 oFd80RgrwRLMQF9614CoZHCoRRTd3WZUUxH9edvBrReas02G0M6i3vXH1udstsLwgRD0QPadvIe
 1u62ILEqLZvhigunwBKSuqHEdQdnFLIQuDfgmeg7yqX45QtQFaEGJba1AXBEeaEZ3df9o6HutOJ
 DzeqTkyfS5r3ZHP7NGg==
X-Authority-Analysis: v=2.4 cv=KpJ9H2WN c=1 sm=1 tr=0 ts=6a86d231 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX8a6O1kCMnYtR
 LBpCtaxGMaeda6wn2Z5YtRT3H1CjKi10S2XZ5uoN+xa3IeN1gzseqDBXKwovov70TbFqDl9Resf
 /aTMpP5UK9iwni55Sdg8eJ2JcM+muSU=
X-Proofpoint-ORIG-GUID: QajZFVpqtEciL05hZRMCueixLleV-2RK
X-Proofpoint-GUID: QajZFVpqtEciL05hZRMCueixLleV-2RK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index f7e2d7ec60c9..b5cd4e3917b7 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3784,6 +3784,7 @@ static const struct qcom_cc_desc gcc_sm8650_desc = {
 	.resets = gcc_sm8650_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8650_resets),
 	.gdscs = gcc_sm8650_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8650_gdscs),
 };
 

-- 
2.54.0

