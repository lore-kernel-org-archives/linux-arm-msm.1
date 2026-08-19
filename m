Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4A31714A
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144005; cv=none; b=kbaKI1W2xrK9A4Qo65Fyp1Aj8rWhcAXxBEoZMJnQSIH4A4zs6DgFmsdJlwvKJi/5VlHVac2NVcH27oxvmWdPkYmrCzFtb1Rp5b6U1j27PZdTwpQp0ChOa3LXYhjOPT2RRvmHyzPhcyEoVZKgUEThOBf3W7Aqtzld0b3Vmt2IgM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144005; c=relaxed/simple;
	bh=CwQR3xEeEKm5upT9++WwqWWkpzhYBR/517/lDltuRh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmFN9w1dh5XIDFpbPeISyRV2/xETgGcQok3/uVFLabJwzFUxGQjZgWe+LBzByAhLvcYv7m5AmvnqUF9neCqhcDTLgXd0iIJXfH3L2ZT+67dEC/Zem05rb86Lr1pCiOxeu0CY9qJzTaWUrKbNLXYCPBHm747+kXdqodl+0eL7KQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0mKi/ON; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hdl2ouUV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0mKi/ON";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hdl2ouUV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClLws237471
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gWWMlbgaAmUdMX6e0Y0owWUGow7bInR8FIR/QmaOPZg=; b=B0mKi/ONHfyuxezE
	eFaKJpXsUHAlHCLk1mHJoIawVsOLch80qokDO1Y03B3kJFB3C60Ws65YSpgw/tlG
	/8n0q6BhIQOKGX4/+EMFNaT7gKDszUJtU0zSZ2lwg4gfwfvbNWXi+eUSXm+2JbSX
	bv/RKxQT72z8I4fq9Dho8Rcz+hhAretViWAkMTzeNXRmGzgNIYPpDHxaZ8fJbKpA
	6F4Dcqv3NUe+gXT/imxXOTJmf3OdhFUzBOHjt6WQYuZ3myMxKOJwmMlnAdDDIbzm
	dDMOZREPRtgUduMJOYsakuSKVsZQBISQtsdx4T+B/nYlGeHMT/4ZefNkAfO195am
	U+59Dw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnb76j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso115959285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144002; x=1787748802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWWMlbgaAmUdMX6e0Y0owWUGow7bInR8FIR/QmaOPZg=;
        b=Hdl2ouUVwMjh9YG55EZ5VtwQqpaqerUZ7UdcuD1BkanQJ4vBNhaUXczneTaIl8QKft
         ocw0UDn3W/8n5qhXs+6XGpnNZi4LexK1fdzhBfw92xn0gRQEK7iL4m198IOiKbIUJ/Tb
         3ph/BCXN8WHzPrHA0TN4HO/DsLEULtFWX1rRupYhy3aoz1LiEfrCAjtsL8JSrOixTfD+
         6WjSi21cqTBcVYlvSm8twPBuFYtDomLLGbldAfmjXFkK6yv33NOimPPlAoUNXzeJcucF
         a30MPWW2RVaLEuqlfoHyhtlhljUGrDa4peZ1/rOzV2mG7vk9v1zcWFLWJ7jHRIXqzX9x
         ghZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144002; x=1787748802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWWMlbgaAmUdMX6e0Y0owWUGow7bInR8FIR/QmaOPZg=;
        b=OCQ6PoCYm3M14O3FywdT3nTYl1ppQeinYUNNATltyOoaZkhY8b79Sf6plMEAfnfCwb
         El/yzCm6ggRc+OMSQzymj/WJnPXAw1e8bDzSs4oIHD1VolxT6a8nc9w3oxlUoe7micQQ
         57CcCi420smQHyT/T8cIijgu6/x8FmlGdfQcDVcg+/dtckAT4RD/PtbLI6M3bWtaiIYX
         4rflYqAA9j+iIPq7ZgTqvIkqfNuIeJ5anG97B2i9fsK+vMGP8NzvlEtoyiD7ky7k7E2v
         2oWkU+poLZ6LlCVP7IbXK6n/Va71mX0hyKaaKSZ0Zjjx7AdoMmwTP3Up8iDdjb/J+SaR
         g2dw==
X-Gm-Message-State: AOJu0YzXwN4D+GTP2Wg2aX9SaEMckJ1ZzozIlBds91ImcOJWJ+aS7zhj
	qFqFsvNOSZ1sH1stePAbszJ/2w/ut9thhX7xJvKMWh7uKVvZBSlGQ9sAYF4etlAL2UYUklSWi7D
	tqx0tUCEwo5/sTiYB549j9GhXr6b/htMCJKkMyg/DQj9Y1dAXONsaswaTq6b8YSU9mQFw
X-Gm-Gg: AR+sD11HbEHv8k400w828tB5UjVZIhGvx5/uZ64fh9p5weN1zRAL2Nvof8bx/7Cmmwy
	PFXE3EKTiVxHGLEepLQXm1EqR0WIGwJgKUjfTDxhWXgZtlFR0NmNkmNCiG9G5UsO4PLDcdMbi/Z
	pR0cIYJZOoBkOIziyDG1BGpI+q7z+3MV1oETYjGDyVYufo8FKLbSsHcL3DfTGXzBqQtk49TydWJ
	3vBY8QZkxDEIHcSfNHHOM90N60GAils1nsZ7EmFGuQcCo5F0bhI2D8a08ATui1tX+C4eJoHPbfA
	nFyKfxv39PTKkY4xumcAdi+MLQcC3lD3efw6Velnu/jTVU/ohI+lXT45uQKm8vjhEEmBN/KRjKI
	Q3vH5w0N0
X-Received: by 2002:a05:620a:2303:20b0:937:2443:341c with SMTP id af79cd13be357-93724434746mr101610285a.41.1787144002191;
        Wed, 19 Aug 2026 05:53:22 -0700 (PDT)
X-Received: by 2002:a05:620a:2303:20b0:937:2443:341c with SMTP id af79cd13be357-93724434746mr101605585a.41.1787144001671;
        Wed, 19 Aug 2026 05:53:21 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:49 +0300
Subject: [PATCH 04/16] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-4-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CwQR3xEeEKm5upT9++WwqWWkpzhYBR/517/lDltuRh8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhab9h8E98zJ3XCxIlmFZFvXti63obC1yUlOcD
 dglbgIsb8aJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWm/QAKCRAbX0TJAJUV
 VrBOEACsEV4KF4X3ey6Yxi7huQktT68jQPDvAnfS0lbIrs49ont2B4ayMnODr45d1TOT8F0bkCe
 fyz/45VekRO3v2ifGwhy3EeM9VEWbaYx0u6S6AQC5OHsD70MuBknj4+44PIUVwfh0UIUq2RAtnH
 SaShXvSFvXhbOY/Ep0L/6F411kmRfPcka70Oe5sDhL/VX8pIJ0O4O7sjLKR5HVoEHGSZ4G3rvAD
 2+awC6BBGNbl/Qlb/+qxnmbapq51KzxCu3oSdep/j5ke0XSrm15bk+UcNsonuNtety7lqYDJb1m
 h6HB7wUGsdDO7d8wPKYKzM5lCOrfAD25D2sVS/x6T6Bsym1h+gef1NTHLWoWKeE7TmnsZlsX0tg
 f71tKiB0oDGXrZkk/5BhcnGwpuasMl2kQOVyIjndP/mHfPwrf17PliUrE/vBQO1TekUIa/e4dJB
 ZIkoBuNR3mZWNsO36D+pTS0YKAuhHphIxaRlKNqEE0eX6fI9ZRwYYPMK8QtGh+fCOip1zduSzyt
 z3XH/TkXr9MKSzPVZo2vhLs1Lu+KfRhgF5Wg4MnJVNAYlCta2141ZaTCn1qeK9gY2NIak7laUab
 5BTzRXL67Gmn6SUzf7FtJhWGKarcIBAURljN3U1VdipCVJsnMoR8FWF71h40/3i67GL6FNL/YFM
 WIXB2Ts4sPhHpKg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85a742 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=s1Yi9tfhbzEvHx3U_YYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hdiBU6MBDULS1pscVnSJi46GkfmMY11C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX4umm0FIGmkYR
 r/eUXkpGPR5nEcNujfrTYbGFUQYbZYayALg5WeTHe/jqg2KuaOxFkzGCCrZhFSa9flzzSMT8dLa
 svHgtkd8DBpqKfnnAv7DwM6LpFYkLzk=
X-Proofpoint-GUID: hdiBU6MBDULS1pscVnSJi46GkfmMY11C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX9DnsZvb1/YOh
 /+W5StZMGWwT6GbYbdCO3jDaT8+yhFzkCXDPysF8dNnTEV1jxQ84+p0TZYL6z17Y0IWnhQF5LN9
 jWAe6i8Tq1/wcTpLCJTeG7jsTdoq5DpPltLYwquNe/u8Mnx4SCiNOXODk4IrEAkvPFn6hiHls/v
 xZRSjUNyexxtt84KjuCbsFTQl2LR2xf0d5HFKl9ZKQr8PDK6DqrZp64KvGbOS0FH5Np94q3FGIn
 vw8Oc302D/6MxF+zD8PBkD8dO6QFvGkRg+LHGIcV+y8sX3CEYFc+UwK3nQ6fHOM9zFGBynbGWp8
 2S4k+Wl0RHppilvcc1GtpKAABjYfMNpDofOgu2CjFFuXyixZOihbI1dN3PlbKCHrHihzsfYD4kI
 Q8ciwph9Sv1uN4I00DiCZQZ/TUT2615myzkExT/1W8A5ktO4/xefowck0sxjo2n5abV7eX9+kAJ
 Gs9yBq5q/meqY9/JkPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

Enable runtime PM for the controller so the common GCC probe path resumes
the attached domain while registering clocks, resets and GDSCs.

This lets GDSC consumers propagate their votes through the GCC provider to
the CX parent domain.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

