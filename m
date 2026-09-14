Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268F44A40C
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390192; cv=none; b=joucPlrvRsD4LT4xHW9OJbYj+Qzksuyz5kEq1HcaBbPoM4Bpa6TSP6ZSvO69LmmVaJrtDnCJpBgdGPRE9dxgP8w5waRhNNZsitJMrgeh/HxV5H1CObwwpyYeHiu/bEsoOPmerCUokWYq2tL4u8SX5jM5Zt4uLwc0fnPYU70RnFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390192; c=relaxed/simple;
	bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sti6r7cJdUUKYL/LPwjCQRWb/dbWIkWXrbzsKww4nlraD5BzZy228K7OZbkN0WUo3qQsWlbWVT1D3A6A0bISEJ0vhpFpGIA1pMLnh/aonuPXJ0arGdQ6bx65OAk+MR09sV9/SL4LjmVRhxhYd736uZvtDmF+HvLtKUCW16wXrdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hm+ihp5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJB1ZgzD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hm+ihp5Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJB1ZgzD"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRShR407302
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=; b=hm+ihp5YLoj/5hca
	rqwVYi0uLQmYL67nD4AucTYfaONHn7ZG/5PaykQGEblkRAseIdFii8PbvywUFTxH
	stSPqr73QAqsJRXjrR38Kfm6fu3TEp82NVwFtpGVc4GIm7ICNQ4AKqP3TT3N8+kR
	zfcOo0OM8RkUCd3VVwMkTBo9dNQ+oloayZ+R3nKH4mqw+1cJKZIay3zqqToE6sGJ
	Ee3rYHLLOycjq2XtTwyJY6GIlKPbmhCIl+4qX/mSx030SusDsELfejgxa8A/1cpT
	1DG15hpWno745YfIR//pCVB2d0b+5YUgKu1niRwEGyZbRXecniH2VVO0FDP88HGk
	5QWskg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78a6d5cc851so509826137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390189; x=1789994989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=hJB1ZgzDSOrkI2BWlk9kuh6YCVKBvsxRf8Bi9/Rt1daVcngaS97+OvdUlzCGQTTalw
         LtpVOvnAAOV6CNLLPUEOzQP5ID64Mu76JkMzOqC1EdNrH12t4dGeSnep2t9CjY51aYED
         wjpJpXhrOD2287LKMyN2R9u/03rOK7sz1W58HgFTWWFcYlb9c7fQEwR6ZIEzFxhfUWY4
         L7Cm2Z5ylM9bCOLQcpsAic9cKsxyRo1ei3SdscgRDYVnogiVsW7R3OdN6KVKj3ndU3Sd
         cS6WP5IhPqLupsGXuXB6a1ABSrwcuHZy6Re/nIw+/FigGK3VqgLfCEXju1euHDNlo+sK
         WEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390189; x=1789994989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yt2YiIUjcxmeRABevTH/O6DTGv9FfCisumDHE585x4U=;
        b=io3hiSxo1ks7juLWy2ImfQmCijWRsonZ83otCv4/b4ks5GjMb/Gi16GXePb5OPl7x8
         EQIR5Rj21lFv61fgy9ZNrvvq6h9pOlhLB3koLraW4yZk+gdheOTcDKwZgzvqI5ncdmOV
         VEvCSpWszalq3CUpiB7UKdMUhaDZMB+Q1HDzM3KDMLfIO8LnRB04bpMssjoP1pah7AR/
         NTi+7Jhau8jE/YCL/q/hO3xmi2/LpYC9xz2zp85ifRSAyVN2g1AHNchiZYcxgONWxMJa
         i1dSZrgKOKjnKS8p0oOeytrrFZalU4AuOV+bbhRsrhQm7QNVNmRFmnorG4oQHSgx1Myi
         dUPA==
X-Gm-Message-State: AFuF++mud9WOjMW7r4SLbRv41JycvtgrnxHPZnuaIhTY4fbkXa9NgTR/
	qDJ+kvl7BLeu54UM57E9EZjhNP43FM6ezgQcwD922WC11Cw9F67XN9QyhS0vMVs1nc/kxp2auVq
	SYgT2m/j54aycF7/RWNU158XJ+W/V6BELnIHk6piJvLC/LV/nqU2sueq5wRLKgu3Srdtf
X-Gm-Gg: AYBFou0T3jADL02EhnsJUpvFK9djun7ilEvUdu0V/+L6hWm9j1CNL8MyG6lKHBo1CDI
	ptvyU4Y2vhHsivPTAf2jatGwmwEUVio2jej08VHNZlp+MynN0C1gO7h1mErGPqt1mR11Yj2nvuk
	PiB1/4+RLjAuFvKuEqxkUpztGuRY1G9FQuCRYys6AO+TlICjhOySE/sGjg3/kwwO7i8ncmAilcb
	QiTdYOkRzNoomyRCPw81QAurDIA9aD+sx3/nD2iBQTsbfMko5cyqzVKCBJPF21+YUim0wGXVxL+
	4tMpEyH8MVpiYbXCE2fcBv2YIuMyLzYJEiUHRumSPjIXyydkt1KIRa3lcV+Q3ChEvpQ2hpip+1m
	CULXEKPdc
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr940379137.10.1789390188898;
        Mon, 14 Sep 2026 05:49:48 -0700 (PDT)
X-Received: by 2002:a05:6102:864c:20b0:79b:a93c:145 with SMTP id ada2fe7eead31-79ba93c04a9mr940317137.10.1789390188248;
        Mon, 14 Sep 2026 05:49:48 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:47 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:39 +0300
Subject: [PATCH v4 40/52] arm64: dts: qcom: sar2130p: Add GCC CX power
 domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-40-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=974;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J3cJXeqkpzPuChDPXrn+lkJzJi5dz+bjrFNmd1ysHGw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zyj8btO0HBM8VIehJjngivXyJMoOj+61gH+
 X+244+6RvGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8gAKCRAbX0TJAJUV
 Vpl/EAC/bIibMxnZHWWjqFtBD9usJHYqXl3gC/VAhlsvSAZPmyDyqCKYX3hPZii/4w+KyJmFsdX
 m51i07mqsP9L/XY2nt0SOxZ4xDaY9a1neLQN1Tk9nny+XZqfflg9As9Ik7Xd0IGs7boWT5MTbNp
 Lhd0v30JhuhePWfTzPpjh+OmVOSn56iMijhXNme3DnBtxPOx/ujpgt+RCVHIBiVhN2CgzxHGvj8
 wKUHeU7pW4XwP2r83rO/fve3mF72VDEfjMDJVFtHQiHmZNSj+TPDDXv5gccIT29AV15Wuc6Uy/d
 VuJffo/OK6VhLsVPpv/1NMYBHbTv5c/c80pmm1yJa7xznzlD7nklzQch5GpxqrQG/O0GDNyFjVV
 OS+aE7XtMeqE+8mJg97/G3aqV+ns9OQujXfqCxCzNOKMFCC2a2u0w1CQQZ0CgnEkcNmdAF/gyE6
 g1L3rXDnAcU33FlLPPcyZh+tqvj16A28JimgwqW8qCaKIbIK9T4WxgiqVmtg0uLVqUBdt6mC+E+
 tTqwly2Coik1N48wYW4plhaJtnR9Em0ao2CsHqByLteJ6UUT7JJhUmNgn+Jzr1e5F36hM3PFtOr
 WnVAFnx0po4ixdYYEqptMPSswAQgtQ59OAF4lRjb6iGoriX4ji7+kkgzY1ghnL1wSV3WzFQ/GXy
 /bulBhBera07mTA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: VEQrVOlbp0AUD0r1vcWu4KaoDaYS6uSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX6GzH4+f2wx3N
 bKPOg3KIBlL/d1ukVQ9J2rlHip8GmycKbwpYxhIp4VZAUvLZQpvFt28/PKkRdAXKpoYyyBnQV5+
 LYYEloNqA2qduiqB71+4Oyzu6+Qen6ES3LMo/fp/QPgQsMsnGYdrpyRHKU5osn2BDLsE6MJUylR
 IymtwiVznez+AbeTH7R3QtBy0NmBcDh6eykCgJqeAnEaxrmru+P6kyY5zBtxDF6EwbQGPneX9gj
 ZQiMLCP+zzdqCfCN8xWE8uLTU6x082SGZTGGdlFUWasfogtlWlYq3XQW3XiZCuwT2bBdZrDui8u
 1lcVZ3SCO0be+lV5HHQAC7/gRzBaOHPoPdzQeEEIUaBY+CQUiP5Z5wW0DTADSX6KKrUynLpf85H
 TSg3txaKbCMG3oTSELxCKmmJe1tHmEwz8fFuxy3IeT5W/kOSFH4578YiqY3KMDvk1gqJ+8evKcF
 WW7ptUqfukZF6Su3EAw==
X-Proofpoint-GUID: VEQrVOlbp0AUD0r1vcWu4KaoDaYS6uSZ
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed6d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXzXInFCMi0QeA
 TNszRG1ZxMVYlz2T7kKvJ3lRCTXG4aRc/nYNJ0qrFy1r0Y18DFf2s62ubHzdCJyqRZo00FYbtLX
 0B0qg9YYmo8G+gbafGUfT5mgb6Gp4EE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on SAR2130P are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index 2ecead79806c..ceeb9c47093e 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -474,6 +474,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

