Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074816;
	b=4f5jZTHEu5eCzpTnMwmf8zST1RO6ExOy0UP12bEnndwxUEgEDdPUSH6v6OdESgRMFwtK
	 b9j2lSYx0g8g/sgkjdzZFyYKv/rK2cyLXch3oscFsjbzgpxrNJR66JznTBzCjPHj0redU
	 uUXogYo2kBpUQNZtaV66GL9z7YOSP6NnryvCMnkySljXhPAK7tOT+VFm5EFx8ss5AH5Qc
	 vnlQHt6e4cKdBCvfCrLMmKZGHZw4tMJqDpNifjWoPfr09VlhGXe7A6iEbOdLHfDr4Q2lv
	 ECygN7eoxFf2tc4gJ43M8AICCdaXuJvbotHGaL3By/G7jUm5t4A67hciirJaCvJCWMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074816;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
	b=riEeVTV37qk6m2w8SQhUiZJiAPVn8m78rxWcpxgwD9lqCn2w24+bDCHCkXFClah0CfIy
	 hlweZYVjHNGz2kpJn51+D8o8bZ6xwvoQ5TId+UiJ1z4RNsT/+r4miIPNgKF9/+L68836D
	 0y6Cx/VlTkyE1CpFsM/n6N8V9BhVq5a3vb7mLbJhPZCVXrqTfzoImO8LPMvWCC3o9yIDc
	 XMO7E5RYHyOja363RP8UP/ynXDI6IR7oNsTOAfFsYAVQmrVVcC+ZxHPdWIW96obARLNG3
	 vveYW7UABfeCgdf1Y76Lu+ZJlaaqE5P1mEGD+kXZAApc0BbuIMhqfsyjHgEEB/WE5Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EsUmryaa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D885606A32C
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 18:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D885606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SreeR8Pf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EsUmryaa
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A7HtQPI2894679
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 18:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KtXcfDwP0OI37SAv9nafNa
	Chy8uheMzqgS7OX1e7QEo=; b=SreeR8PfOUXFldSESQfVsX5Yqmkvp1ACbfBR5c
	nybxUPAOJHvDNI3VlvdU1kRKc/j2sMU/ae58GpQMhHw0pDCytxxWxAfoEqyEFTwa
	xxfp5J+c29n0rfMa+CwIAPxjsiv2+IuU+ZBtqHaKIPsSXWcYUM/0wT8lFk25e85G
	NrLe2cGzTBuWzH6gW5gZPpWS6tuHAGxlg9bw81b5gQ6cdK/VOhKEC7RXh6y2Dn8m
	cjP1hTRNLQxraD7/VgVwq7MpHeGG9X7Og0B4hHY2Gq2n8QF5d5EhjMvRuqK/cVFr
	O7zSqY3raS0lDW1ySkxUsCbT4/r3gZlS1ZDlhyHQ4J3ooQLw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvresb6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 18:06:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3690097eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 10:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794074813; x=1794679613; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=EsUmryaaXh/69HxQti2u6F4qfuUCmzxl1d5X8CvG+b6MwUdgikha3XhmO1dqjxQ8KN
         Rfk2FCsmVlDO5hyRiHaZ6g+TVchNwNn+l165WQXgAKuU6njelFDDP6jsq/5cR5OdJ/qI
         5RwV8S40NiqP3c7vxcf9WcDyi5eBfuYOUghaeDWZBD7fMX20S5T9B6rOCrPQRQmCqtI9
         2EdXhDDb7irA5Y26kg3AfMr+wK7KxLQK8R7G3hXS1ZQbgIWhdyQjcEqSchGKXdvnwBKl
         siEAjkLb50nlLZGhUTSMPWI+fl9Es5wxa5rApgfbqrkwTxveaZbbLoQZKXXAqiL3YljK
         BjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794074813; x=1794679613;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KtXcfDwP0OI37SAv9nafNaChy8uheMzqgS7OX1e7QEo=;
        b=LKbWaHU6gIzTroKlDYUrjfr7ymXQ1sWBa/i3/bROlC99aWwndvKRy9gctS/cUDJ5fo
         GTO66hmqz1uMgTS72xD/j/OJcth9lqeRUCGum1SikCiTNTVi7NyG53jDnzEyHh43dx/w
         rwA9ZstqaLnIbOygEbhldDndYbGq7xhhmextXaRj8PEL6LlvCCHqc6+cWHkBcypAg7n1
         3TcWTjYhxB9b6mRGlg0h8dXwiz5JYndMlxzAxW7QadYyrohlWvjpV+Gw4tugBs5i7W9m
         1Y8Mghmp4dxS7OztOat25A7kE0q7f6DM9vY5tNhDEMHic39L5tanCTvmf5MS+s02KxCn
         pb9A==
X-Forwarded-Encrypted: i=1; AL+hErHV+kyLIn3Ph/elhItnhzDcOb54KNBg9kKmzJOSaNBLb8lrvsCIQRez30xY6j7WeUNCuwMjUBucelgn9Jck@vger.kernel.org
X-Gm-Message-State: APuU4Z/8GbBtDv/w8TKfrIn9EOf7bR9PQb6mw5YMcREG5pllsZ0wrAKX
	Ub/KG9qsZLmu22k7avKcGcb10cvcSuz7xOw+lyjnClp93Rd69ov7Pvr9is5CSCjA8TjJ6LiO98j
	7jW+5GTgrqLLt24uthT4BDJFbD+opDVIn53eW4Zjk0eKjwzTiElsPKtVZTjfTwQAt+YUf
X-Gm-Gg: AYBFou3YigdfeycNW4hg9PIFeROMu7xj89TpGlcT+CB81qDjznkKrHXlajUCIdHBGXg
	jxWfBJf1fR1NcJNM5CjiI7wh2Z49laAr62zYFkATfnoyxoHqJBNCBbL/JgYbqUMzpOrOhsxy3AZ
	k9/TdI/9RzwnQvd7AIzz9rM9bANR9/YPg2/8nrVougy+V9gUsUK4Wis8JbVlDgQe5I8sgbkuJnq
	kyXS2WjRMHqix9ny+EWPc8qZZEIoJZe9nBJG/d6Y0S/x1xaqLXUSmSdcrg45NmPrv48GLuW+eu6
	zC2GjRyBaaDPl0qb7BUTOWIVuwq7fg9HeyefbR3fMNE8uvd+8xmTKxdWLgOuh+8XZt7nTNffV6L
	yrcMMLT8FsSB8X8heBr3VNe5LZ9IxIFHSeYNisCjrPeV4ufXrstbKO/Ava9r0G1elfzcj3+4p
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095931eec.19.1794074813475;
        Sat, 07 Nov 2026 10:06:53 -0800 (PST)
X-Received: by 2002:a05:7301:4d0d:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-36f75e28a16mr8095877eec.19.1794074812701;
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm24710212eec.6.2026.11.07.10.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:06:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: Add I2C and TSC clock support for Nord
Date: Sat, 07 Nov 2026 23:36:35 +0530
Message-Id: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAKto72oC/x3MTQqAIBBA4avErBNS+4GuEiE2TjWbEqciiO6et
 PwW7z0glJgE+uKBRBcL71uGLgvA1W8LKQ7ZYCrTal11akF0bNAdgk7OGPd0qLb23jYm2EkHyGV
 MNPP9X4fxfT86/JO8ZQAAAA==
X-Change-ID: 20261107-gcc_i2c_tsc_support-64aa352d3b1d
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfXxjQJjFSmIyQM
 m0XsVTmtKwxI0aj9ByCDv03BgUi+GaaeeHUTWydeFOZwpQcSl+ze7bPbqSGylyX3X5MgObm/3gL
 OXcq6aq35dtmrzkZ7c4+gLcJSMqNbOY=
X-Proofpoint-GUID: cpyU9xbkuSfbQAdY7QOfHGaWoapLyu6w
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6aef68be cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L8zgO8z3qB8kSUkvw_kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: cpyU9xbkuSfbQAdY7QOfHGaWoapLyu6w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDA3MiBTYWx0ZWRfX8u/0kvg0Rlgg
 Qe37WLE328hPa4zaQzv8FtScWUF85LFvHUu5Lmc+Sf+uV8E+cU2Piww5y/yUrAmGYfw1nNPSy25
 AcmBSxjWdpEAJ/72SobrdnmtIIFx+THzamXjhIxHzNoTGRNgu8dxRP+znKghWhWazrvgHT4ii9f
 zMDrjwTsXoLsoqhkUF5S+wRZ6lI1S1GeZNWTlDRLw+/CqxEVOMFmndGm8fhRXDmPwjiFsvqqqhz
 xFaY/KZI6GP8ywTfhxIBzqRJDTG+XEw8SiqDbIq1N6BxEEeY8V5Se+4hphPdiRaOc9gTUZ7Mz9w
 YqvcV5SlQTVe6XKRT0/lYNHU1Q8SLcfLbQwBzLtVRi3IE5KNEz6e66aQPpULYUMAGTH/rHaf/Gz
 ETbz0Z3ezcmdhgFbHzjbGiCJrrVJkuzJpPnGTq9lP/o1UkIFQT9SkXS2oZbAN2SZPPcnoMouqUY
 dDwjqwzi61TflT86UEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-07_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611070072

The Nord SE GCC provides clocks and reset controls for its I2C slave and
TSC subsystem. The clock IDs for those resources are not currently
exported, preventing device-tree consumers from referencing them.

Add the binding IDs, then describe the I2C slave and TSC clocks, resets,
and TSC parent PLL in the Nord SE GCC driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: Add I2C and TSC clocks for Nord
      clk: qcom: segcc-nord: Add I2C and TSC clock support

 drivers/clk/qcom/segcc-nord.c               | 187 ++++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,nord-segcc.h |  11 ++
 2 files changed, 198 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-gcc_i2c_tsc_support-64aa352d3b1d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>

