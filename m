Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F46472F75
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390174; cv=none; b=eeqJ4BIE3C0gTGPkN81m1OmUOiL2OfQeN7NMUubAjWzA65t8DuHJ9om/VJE3Gz+ezLydOvu5Ocv0suHYfbggaXjtziqYBVlJuH8YIbyGP7GnHWYwqdhoSoUYJ4VCpyIBLMRyPDBn/ykNR6rK4v7pTgHezyoPDqGZi2bXW0Cy8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390174; c=relaxed/simple;
	bh=8unvUEpP9STiQNoF1CREMz34B7ZPBMJvLglEkBYOewM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mRGcKM6lcJQE1lxd3hXJ8r9bGax+3r37mJTSLdOPboSMeVzjQoDQicWx7iFYFx7nHMX7FiOxCoPzGl2GZ84+Fcd/9lnl1hxip+l+GFe1rmS3JD9bxaNtYmo5M1eqLeh7NpmmPbh8TdxE5Kf9WIg/CmY1ABfIkBCl4QKzA2DYJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MY87Q0AC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6MPm/ww; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MY87Q0AC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6MPm/ww"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1ft727675
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=; b=MY87Q0ACcqUs3OFL
	CyNz0b80TTk7vaynmsdRltqmTToi9F3IBMchagaWmI8+0LVPO/bEnkt2iYJfmYwr
	015O9RI2mdkHGpy7/d08Uzd4vYyBS1gFx6wLQv5+qZGW7mR/L/6VhqOuMJN334EE
	pOzQ6KscggQiKK3pcU99tPRiadxpXWQ+SJl/6BGyesrUN1l1Lj5YXaVhZLW9jjsF
	X9llEpcGQouEqMbVXNd3Ap9Yj+Gv7hED3RRtpm54ad50IC76sbDsu6q+sJpg3s64
	uYef9WDWpyF2pYIyCJybqti2bvelbeTwufsKG0KbzK7rhuZRkcOk9Qo7zuZJpVIz
	uDSk4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5ry4m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0312937eso208045885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390171; x=1789994971; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=;
        b=H6MPm/wwSgnQSImeBhL0w4Lwxngc+ne+CF23WyhyuS4ZbWVnZyTepIoSpAGVlQcp5U
         meMyjdsKPfUME8N+kIXDpcUdQJYHE7sz5QzYshF56XKWlWrOlc9hTe0xTLydxpYiXID/
         I30zFL3XnlykH3oVJBBHjj6fdtKFmmI/AGWasAP/v1pFZhqTFiNucMzUJJWDVwEeag1V
         U7+EATn54ZXfkMkn8qodY/OO3TnM+rt7GtqNoOq3EA75Z3N1JWpOC1TP2YGh94aB1o81
         xl6Tj4Xjqs7QoDjc0FmY3EteBhPaL1LwkGxmufaBqcfuCs0gtHFfmc4y/ju68zvC6qtW
         voGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390171; x=1789994971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS8xI7KTU1nTf1SesfJE9zQsO8Grh9MUHlF+za6AxDg=;
        b=ZbevfjeV4NBIW5mvjbZp79Uc9hsKM+7W6/Cw8lR1kfSUbAfaB2+gEWaurs0Gy4OYs2
         1M2WGuyF1LmVuBcTlkmXQXY/i7dfx7f1XT5w9yGnawdBPu5OZAAGHUNcGNRd6StUxOE+
         Ld3ZUuXSUNQyzb47RrodhgCebXAJ6g6Bb7PGekBzbSjXt/IYfMKHIPBDKdT+7wpZnN2d
         hLlJTmhvNhnt37EVQxtHndJadZAXYw9mOEbrwiw7yT4i4b77HZSQA/lyt7eiW+hIQbW/
         gKHmTSnIjp0fBlokhj1WF2nAhln+cibs3QrAWZXfAIpqKl6jRp1DimsoNdAuB5zhpaSH
         mTCw==
X-Gm-Message-State: AFuF++kHhOHGl8uOeqfFHDKy5nqlBsMsI6zCXARUavJKzJN3liP22MrJ
	C5L+lJVubwOqov8eHxVCsLyVnsGK1969bXji6SLBwjMx1e35yJTov+uXvrkGACpSFBgodrNC10D
	olMXXt3MPJ3WvPKrspIkmGqntD4ByFnrOTYBIjUAbgucXtbEF+pfTmDOHy9b27ZsNnI2z
X-Gm-Gg: AYBFou1b3Cjp5Ikauxvw0v17KOUGJU+NFo+B+94GSL7hUs66iuQw3D1QhgLyr3/OeN8
	hwjB5x09yeEpKXG2wQ2jtZxuHNaQ4AFqwx5bPu1jaYlUs2s8dElV2iyom26y1cXzboxdq/iv8fP
	wTDgsxj2wnQfqdb8fNyoymMvsC7bP5U7khwR5MUtAWgaY1dOj8vA+CnFbZ8jdlWVxCN8AdgALCG
	LpumV2LP3CuSMaogohNIEx9cCNySKjzcR+8wVOu4/Xs92OamDi0wkswM0QME08lcDndbZeKHypH
	dM7ei5f1eXKbfSoP0/oyxwYl6KobrrUPwFEueYqJzutxnPdLgbs63ysaXpAr3XC0nqagiRPxpQ/
	irWS2lLBp
X-Received: by 2002:a05:620a:31a2:b0:939:8f2e:a0cc with SMTP id af79cd13be357-93a299eaa8cmr317619585a.30.1789390170502;
        Mon, 14 Sep 2026 05:49:30 -0700 (PDT)
X-Received: by 2002:a05:620a:31a2:b0:939:8f2e:a0cc with SMTP id af79cd13be357-93a299eaa8cmr317612885a.30.1789390169886;
        Mon, 14 Sep 2026 05:49:29 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:28 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:32 +0300
Subject: [PATCH v4 33/52] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-33-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=826;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=8unvUEpP9STiQNoF1CREMz34B7ZPBMJvLglEkBYOewM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zr8ZZbsgQFGJcw0YXyNwtv5CeJfAJFldSIj
 opSd7Hp8SGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs6wAKCRAbX0TJAJUV
 VvDOEACdiSsorjb9lqVUr8uCCAh3SVvKslzA1pNJz434UyGoTnfaGE/M+5sxx6MeqZYbVBfYrfz
 kTtXWDE/Yc5Gt6KnPnZtol944tvuNWjsIjunY20vtwReq/6b77fPRW9/ieviyqf/TftHM4r+/pT
 hdKLgEHJHm+I/t1xjnHt2NlDURAB20p2aeXVMNBP8m/TCe4guIGyMB1IYIrR9qYj/tmiK1nRwh8
 pN1cH+b/S1x0LB/N5z4zCG81AGYTRrQovwTSl85ix3iRUt7ofqEq3G2sQ+L8ija2Bm95aCLVOmp
 MBOwSc1kTY7X9560AwqvI1mDQZZLT4bihprHF6IEjxLg7A/Tp5cKzakyi6pJj+x2XgyWsZ3KZwV
 q/qiQcFSyMMeL9akKfSMRXIMz7zTSktDDrGFiQQXmJT47jLFPTuE1LGZaiT0trh1gF7/LY2IfF+
 S1aiQTRwb7dr2r7G1UMp0yuCNH4wHW7nCkC20uaQssr7Mqfv/z6xK+aApTBJZMf5q4n/sSKOjlX
 rRyNS7DijYE68Ueoi2uz3wD1+t3njTLqsv4kqqEk8ZhFfeaJJzP8rJPpBywIIhV3S4SCe6TWdIP
 pxSsg55LgYu9itg/01Rq8bxE3WQDOaVaVFh7D9eyzt+asuZAoQJjFgbSpMuIRmzMJdlJdmAawdS
 4NrQTtwPAQuHoBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+c1UxEMCWUVM
 mwnGMfJcyUKsHEEUgTYet2BtEBXwuC56Fmjdcbgd7H1AwlZzlm3eAABotig52XhJxLJgVQSMEMp
 J3OyumNJGdyoPuAsZxywwaEUKUz0FjE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX8i5yErDG/+Y7
 xqeb30FJwllmX0wiK8njwQKfFjlCySuFWhgUx3QKGGzfRQzWDholMlywhDGWIvDAH2KPB6FVmZj
 eNSxIWDQKf6m0/UTV+YOJ1j6mbWbUwW43zztRLzyjOPt14Z+crmARWAfwMUqeAuXx79q57uVjcO
 +n8qh/9+nO7RnvlfFnLlJVlUAT3Vcb+Ea5WByDogAQUBoXtOK6NqJroXhlzZ97PYXBX5bAegp2M
 SfnriGP96oMr38Ng2Jex3hlj2BU13R/Z58iT+0/8XVkrS3cGHx+Gg5CurybTGXyYHov+Jp8VtCg
 L8mQ9DJ2aRtSsnTerVyTWNJSsJ1uO1I75vZnDO8G8LJPfls350OZ0sXTy0NUdpJO4f2Nqf8CWWL
 fpc0L0ajfIFLsqSOSJ/YkuRs0dqxU7Zksy6+RhDg1QEBIaKUfHSiCUmb1reuBrowXfpIusi+kzz
 6MPPtaAttR9/AcqvsLQ==
X-Proofpoint-GUID: XKHAmoqzHORx3aFP50Eg629HKRoR-w8z
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed5b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ESHVkgNwe3RMy11JppAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: XKHAmoqzHORx3aFP50Eg629HKRoR-w8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..4d6db0e59bee 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3327,6 +3327,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm8550_match_table[] = {

-- 
2.54.0

