Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1C47F3D0
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390137; cv=none; b=ispZJX07jXSknvld3kEYV1NksLJDlABkKpDQwLb+m/rqef45G2SjtbrHG3stm7AmaC1ed7q41X4V34Eh/+M7/jfZOWuha2k7/kohjgm0tlbYfsz2SY2Fe8bn7pU6v9T/M9Y1XObfBJafaNBV1bIIRKG731G6IvZEt/M0pHGZqz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390137; c=relaxed/simple;
	bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nL3yJOsLbYH8bV6SoHXTg1mY6q3P3YZSeHdnZ+kNiprRXMfsz0gdHshfLW0klitTfBohU4UFRd+7P+pzY5Htndtr505O7bE2vvLmWBQ3yu3140tyDlzRy29Tq3TZSbNU+U89JWlH5T1QlvDusjLWu7oP9uhfbJhLL5uXLwFBu+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lc9MRZwr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdT09wF4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lc9MRZwr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdT09wF4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmMwL4032520
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=; b=lc9MRZwrSqa/MTc4
	O4wJylvJl/f3UNjh3DpSJ97EZ9FzEAuPKL5paGJgCNE/G53q9DrtNTL7kbgLxVtj
	vQrrpvjpY1QtpnBVl4ZfvsNmId3+ul7ETdFW8yccnVaeOaTyx8OKActHxQl+Hs7b
	qnPIYGbr6D8bWkKxlRnjtRzTJvVVB52zesj/X91KR2wsb9ZzeoLun2b/0HS0vhxr
	R10r+sxgFmWAAGLQJpSawl8DY8PqFiR3m1RfWjtt82cyXA0s2INuUH/Ntu2ZTOlq
	DE3EEoVyeaUtgen9LiNQ3kOEpwp4ag1i0ce8UMNG8GrTp5LJYXUAre72WoW0asHi
	p9hvXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8kp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:48:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f27c80a3so638650185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390133; x=1789994933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=YdT09wF4a1k3UGnrLNnSKOld6zcISW3QjIhbXlc4RupZjyb+zTDT+6cYzLl9+CmFqR
         IUpdHuyE/XghlXqN2g1xRXtUr7Eni+TAb2Omtvsj4XTnLhn8W6jbyPobn1up64IGacsc
         lihFNYvJGhGgFmEan8ubLQtyBQgS9Y+skmsEyxmXPRprfC3QgO09v9Os2G5kpM0htYJP
         cAUGWaLLw7VG2ktpNjQyrUZpGxCq2xzJVYkVbdMzlxWgxKl13FR0+19NCDFVFgNBVZGv
         Zc3BG1oY5KC0M1tc/JGVAycpkJBJBALW+qGuOjGzThgmSXPhCFtT9GZ70of5j5U0tXrZ
         eg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390133; x=1789994933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2eubbFe6832TjTEsKIoWTGrlphjJqH3y1kUAOmI0L7M=;
        b=FreTEdgATlxJeni3ipcvO6pHuNVtbOoEWgcROHcbbkqz/9wPYUDsIibqk+2p0FelqD
         xvbl6eJzzRlw+MtFjMLfbTJdIHYQ0xsHbDx0BOHPNBUv+oTIchEDU/VbHXQY08o0oGeK
         Pdhcht8cm0EmsX1GWm2PnD9DHzc1R2gzGEDbu2rHerJk1mtWiv5XPHCyCniR/ZAQTfmn
         kJiOfijJRUVn6Hl0ryWP7vg0JPVSOQl9DVNkEDepYaDRtkU7xh17uB7FErs9wfgl9WTf
         eQibHmbsv1luw9LojidYA0l377uN9SKq25v5P8WLi8+J/p/I8dTviTpIhCn0QLupyqov
         DNeA==
X-Gm-Message-State: AFuF++nhazfGvhy6kpqjsN6YBisJjygeBIuHR1ibgLoW0FhdHNvoPGv7
	Y9AUM+VPCXMMKB8mzyGEC9kW0JJVwU1tvTabmA/a3FxADnVjZQcrIqdUjPcWPJ9vQON2QYyqvYC
	71ex1QNrB3pjGPZTHOXYCPKZ7jo9vtfH4UQrVoh4WEcQMuOHNL0759EKMJSezKu3jgrdj
X-Gm-Gg: AYBFou2hX1OhlG5usvOdUiYEUXs6T7YnNLhXZy3Rzv88aVdR0KCXTXlaZ6Glx84t8Hd
	x4pkmAo+TO/YDcjZNl4hmm8940iP9H76xRp8H8kEIGPGtPGO91brFcMfacfSnr/vNXs/pYpWLgc
	/FNbIU5PYWTXRpbe3X/RkZHVAbDnreZuAbrvpZNB3zJ0lDIzG20q2sNQwwFpQO+yr1cQm6iqee/
	luRAHJg9myzurQre9E67Hglq+gzwhh619s2Vqsl8EGE4GkYobLVIfOeMAgodLmRMlIYutK1aAah
	I956dl7fRBKOCgvtbV8IwJCiY27+uFApAfMpfWQVuXxC20C2y8HxSgeHKeUHSGBW8p7xKGkg7Px
	ochyeOkJo
X-Received: by 2002:a05:620a:171e:b0:93a:1ec:748b with SMTP id af79cd13be357-93a29803c94mr322311285a.20.1789390133046;
        Mon, 14 Sep 2026 05:48:53 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93a:1ec:748b with SMTP id af79cd13be357-93a29803c94mr322304985a.20.1789390132535;
        Mon, 14 Sep 2026 05:48:52 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:18 +0300
Subject: [PATCH v4 19/52] clk: qcom: gcc-qdu1000: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-19-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qMYu/HE8xyE+mu99RlvMG888zm3uHFneAxycUzJGp+M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zetbPQZ3Dm9nRpJv0rQZRQaSGvSI0Otf6X4
 XVZn4bBMD6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3gAKCRAbX0TJAJUV
 VtFpD/4p/u7Mw1156YQBr1m53B/NmtwRqhgQCvyqt4oaZ6EeA45oeQ3PjNr/d/rRK6uUUDVG937
 kPaO85kZsRdfGW7txbhT0Hv+5juDmn4Qq7glT1/YOKPyki09rYrzNveEFv3Vuf+OIJSrjPB3kCV
 pLuq7TBJ+89rXfSf5ILlyB8RNR2aQrWJWy0a1tKvlzDSkRo/J0xkf3TaiJPW1hubvmiuMUk1l0Q
 +KqFUaR2Knj/fEjw59UI9dtax0DEuO8GeXwRwwYySmDxISTZOr7IdLmEAYBKyXYvW1PBGvG6VE1
 S6xNrHT2exN3K+NLnXsyD4tBbMnncOecoPCA/M+bSZWv4uoHCRczJ/ZYujj0enw5RaNUpoclK5t
 KrrQkgkjlTR4eLX0/lXOJD0vHOAg9Sw0AD90h2aLopQAMHOog6+W/Okm+oVGW+l8PKjiZORAf3A
 kqs/NKozbMMKcrNXTDEADluazarAUVCobwdxs9gCLaeoe7ZumQFrIzO70qs8qZM4R++ADIuK2lo
 Rtz2R2al5kQsEM2ycF+7Lul7sfCcXaSikEWX69wmCNWFR+HQvtHBu0RsjmjkV6L2tri8TqEF9hi
 WduGL1plk9t+ejtnGMABAYJXjidslEqB+/jkZWXlGGvcsTfTXII70b8ab52en/qX3vJKW5ai3UX
 FXQclQa+AROzsCQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX/w/3GzuYmzbU
 udK/Y6RQMcxbKNRFSrzdnauj3aTLXaqImxKVh3JTDwBaaUvsphlcXtL1UjpyQ3iw8ReaQOe18IP
 AZ88Z845uWjLNBP2ORUzg/xwK7aQd8enahouGd7MOpoEXk8NHhiDF7Gi+6FlqW7E2O6sD66Qb10
 EIRh5UKjeWuLek/jKXtDYPl6uyOQoR6a6MCwxZODr0rm21Uu5An74HdFe9xZFY2hATlyybone7h
 ly8qJbWEcTKUrbabEMa0oB5vo9KCg7KxkQnj+8a1fmDrWslZ2KDZW3eAj3AZ53jH80uT8wzKvv0
 /joiDavX5AGgVg4i+VemQ9RRWtlUMvY98osaYCcx9hNFFRwBpl1rB7mmUvbPGTI1ApmZQP+4DTX
 n3o/y1yYifLrtCRB6krFWl2Wjw/mnw9Dm7AkpEDtCcOzS8cMO9zFhuNp7RvyhVlPMvPdFvX1Q75
 6Y/vc6zIfsofXxCb6jQ==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7ed36 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 7-b7RLL_mS4Bg7AvCp4m6zI7YNbLR3NX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfXz08Yj4C16kC8
 /K9cfa4c3OPQDw2vJv3LvDRUQ93huxzQ9ElXLZirUnJhynxyYSzF0XbPzzAUizpSSDp72HF/iCP
 93kVcskaJHYxHP5guivThVed/Ue9BoU=
X-Proofpoint-GUID: 7-b7RLL_mS4Bg7AvCp4m6zI7YNbLR3NX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qdu1000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-qdu1000.c b/drivers/clk/qcom/gcc-qdu1000.c
index 915bb9b4ff81..172303ac4c9b 100644
--- a/drivers/clk/qcom/gcc-qdu1000.c
+++ b/drivers/clk/qcom/gcc-qdu1000.c
@@ -2649,6 +2649,7 @@ static const struct qcom_cc_desc gcc_qdu1000_desc = {
 	.num_resets = ARRAY_SIZE(gcc_qdu1000_resets),
 	.gdscs = gcc_qdu1000_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_qdu1000_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_qdu1000_match_table[] = {

-- 
2.54.0

