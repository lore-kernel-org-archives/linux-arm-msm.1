Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EAF496D22
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246522; cv=none; b=lLMmnJm5Rpyfdb0vQkLXTsx5R0muqceYBggJXofJzJ0NrNwbXI9Y6ZOOgoNnR1DYOaRf9P+k/tjqKG+G21O9LYgtRKtL1bXYaJihJ1Ad3GcfqZt/UDsr+qVJlkNxWy0OWeg5qpP9HCm0BJOx+Qy5Z6vW8m8ilnBHYh1sHR9tDyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246522; c=relaxed/simple;
	bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAfIO/bE4+IUJkZ3WZzdVjtQJ/nbsVwVuVFYq5ODM27h9Gno+X+f+XrBGVuRZuDUwY2/upSpFDnWR5Fz+EzjJaNrA9pnZ4u1G7cIDF/o7y044pd7jLt0/6QTDUrOoZvjXLRiwy1ivmnoHhfrJoEcy0hZyLm9GJHjOJ6wUi1uRkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1/ftUJc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPUIAHCM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1/ftUJc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPUIAHCM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA5LSN1175624
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=; b=J1/ftUJcqw4NQepm
	Ve1CMqTKImAZear7QSAxiV0wIwJ0m/DuPL1BAK3vZy8dntbKaTFJEqJ4yOEJPyTW
	zfLJDnIN3e6HUyPY/1GsAn7USQhTXOscIVEt+5sryAwELB7MXAwU77po4XaNAaZW
	CA2ocTGDVqNRYgeztCp8Ipxk4XmOFii97L9G8qoa63Xarz1mtMBtXROYhXMQb9ZK
	nv1Zodf/k9l1YcZ7HtgmTxHlSsIt09DVl7S7/QgPBGgcUywUlOEiKJzCPJBaO2v5
	4IRoRmpeWHD/tTiMPJUDoOiGTSxfyJyqXlxpmMPBG4ATK5OAnzXEj5YE9tj1YH91
	SLBbrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7r498-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:41:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so388650585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246519; x=1790851319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=iPUIAHCMDlg2UsOdEKxsxUDRN9h7U36sfKAqI6q8FaB+WZJsuc6IytWhkw1afYAxyH
         K0DoJb9vCb/5wIPdVbM5bI4FjxweV+M6R6JQVo1nZ5i31gKgqaTkevcSEXfLVo0YX1kd
         oNTUUJMrUQt6Mb0WtN+JSZYbkTOzcZdD37wuG162B3hS1yq/t9PIqRmIthx6QN62U7QP
         PgLWEe1k+ZHaZqmfFZKQD7o0SfuMaGl43fjT6kV1kwXRV5UhBzfc4cqCY5RQ1ajipCFa
         A4AqFx9jKHqmmK5moSnfPvZ5efhsEnQ5CRu2Fezi6zmbi7eh0996sHIFYf/gSs+Ofwbd
         bZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246519; x=1790851319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=qiMMNk+7qHqf1LAKOB+61V+fBptn50m3fNuVVTYQhPgw2JGn9sS368J/VUQ7mMlDy3
         bHRLx6ATBtvqfzLAqVIAoQkSaofaKVHnRkHS7FYu2eePXuWrLCo6Schof2s0AN6NQF9V
         SxIPSTYz5F/+tc9YrXiwwjQTyffJmgx7B0hM6Hv137ZI/uPNh/i+K+Bi1zNHd+zQ341t
         yt69cX6vE5bfXRb7DpYetX+jjiuOtajraIg6GvBBkXDSkAl5aE3e4A5hKbGUiIuEtLqs
         EO84WPIjbKRDKylxxoKzcNEO+jWVdrFhO1W5VGUNpY/+rpKQ1GQy4mZ04Thb/UPGAc+o
         7K2w==
X-Gm-Message-State: AFuF++mOtUCvM789XqT5kOxl3rdrnV0w7OhQs6hBQb3Yc9G58oaCKlNN
	60pBzzFCfdEmFzCI2J8A8WV5Ud+BtJZa/FG3KmeU1GH5GmbIU2iLEhqDJxwHeclFmoyFrn1eA1A
	Sir89m6XmjoOUBXqzz4tz2giUWi0NAPQcVLlY6CG2FjmACCQWu3qXgKoIoFKBvhyyo+W6
X-Gm-Gg: AYBFou2bVZHd0IxxKZwtuhzLS13EH+2L0zRodWCFMkuLVRPjBr7LiU+htDo39Q41O03
	OmBM+6jyryOG11VazwjLIOVJu4PTPp3DCpGdLm/ufcaMFbv3MuUgkuWuZIaqI4Z3ggGezD+WgyA
	8zmNSwUrqEmeIpQ6lwnZEwJzcjSpM9k40VWH0BYkf5r2NjPjM5fI3aL7xZMN9Lm6exOlXhU/sWi
	ebQusOKxPZ+zkq23Mz1U6tv4pQDzs5jPlLfYEZ66DkufcWNtfPfDqASye+uVcykXQ45gwxjboNK
	udgljThfIprzh9RND9r9mfEc2qXsl0E3EbNrS2cN8ha6es/UPVQOMUVu3L4OKDiH69fpsmYvb5R
	c7y3lZbQP
X-Received: by 2002:a05:620a:6f04:b0:939:a45b:76ee with SMTP id af79cd13be357-93c3632047cmr233895285a.23.1790246518466;
        Thu, 24 Sep 2026 03:41:58 -0700 (PDT)
X-Received: by 2002:a05:620a:6f04:b0:939:a45b:76ee with SMTP id af79cd13be357-93c3632047cmr233890285a.23.1790246517792;
        Thu, 24 Sep 2026 03:41:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5dff204sm88239935e9.14.2026.09.24.03.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:41:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 13:39:56 +0300
Subject: [PATCH v5 40/42] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-tie-cx-to-gcc-v5-40-38732033e5b5@oss.qualcomm.com>
References: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
In-Reply-To: <20260924-qcom-tie-cx-to-gcc-v5-0-38732033e5b5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtP4Atbx+Wq8nmvAg2M9gzxj/1yDvRvMg+Wfh8
 3FQTJccy2iJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarT+AAAKCRAbX0TJAJUV
 VsEvD/0VwTRiSAoNsOomuT38RQe9QRlWzecZEhPlozm9bQTW1n7i++uVZjQI2I43tVpKUzPHXb1
 gWiy864UFWXFFZuEtsPOKdGPHm/OO8z1pitUMYHuGOiG4SVmPUEclVbocQeoZK18UuXBC/wk7EL
 N5geXxLoYYqwJNIEAXl/09qJU8x/ab8SLHDEt534QV9AHFB0imx96dAZnykjLoUBBOAxJVgpRlv
 M30vx/Q0kMNJaHoKJHHM4Lb2VbAQW7nN9orVoKHh01KLQNSZNenVnZY/amThTd2IJgB6mQQUj6G
 XuXW5USSS1NEqYPCRcx8cxyur6hWbAUTlIdXFWLSLw8eKYpB49owY6+0pQhv3MzLmr8OkNV7Vl1
 CICcecvqYFGvjD2qG+bFStS9Kcw6OrxZ1Fp7w6uCIYH+2KlrsgN6AU78jOzVSlWQ9wqxtNL1CYt
 xUj894TCEUZ3hF5YznaMbt6EnGitNKHT4nlWYfGE+XGu9N6mXENl27nvHFLttgTsGR5Db5DSATr
 fzevuCg+Pyk8OgEsJvdog9TKGPFlPOArtzt/qI1Z1qq/8ZBgd9kD5LJd53aA3eb03t8hoap4sO9
 43q7u997zSmdKih4o+0Z4ikWbcZO1F6PhmQhlR7pQVrTdbeFQHamSKpepPNv8xBpTaFgWD/uSz5
 EYd6vntBx+TpD5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FJx5IKYq0Ie-4yXqkxHmtXGZKLikGvsT
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab4fe77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX6xmEEPoYLTDO
 iUC1GlKZ58NkvxdOhYesSjXP4A7iRHdHOM+XzVznzlVREXpSvs7hv4Y7gSUn8hfzaE5pIyxuvtp
 95xM2g0j8f4nDvcq8JecP3rpqeOY6ZGjn7pt3jbci+qHn5KzUeg81hP+FsT7agtOb184lMU2BUu
 tEvaGD6+mxImvYOXoy5jtWopIHt5PrJOt2fHjreTQ4LBUYz5Qvd7h3LPi35NcmHeCgYA71iiTbA
 Jo93UME5rwUGzgD4qpG14qfqlAArySuL1vwWc8qNRsDCGKb46AzCJz0X4qVVZstDYmWy+Typhzi
 chMvXhGAg7TlFJGQSj4ZUva5Kf/tEEpcH+ix6Dsj8GZyfIahgmXTYP75zFKVcq3tedXyjILt15u
 AVNGxA5yi8U5LT2YNfphuxCLZ0LkpPr2PzSZPc5yKpg0ZbquG1ca/Pvir6tWjgaHeyFYv5TScs9
 LeQ1etpWgTFydeww2yQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX7mTDUZkGEHCc
 9z1HJlAmxpXuMHHG8X631OaUxlM/0S7jYrIbkSOHSOzr5SNRQauOZAXjLwVHOrIIWQCVYFRJAL6
 Oos5n0qkogU1d2+e4G92o6unKNSBfy4=
X-Proofpoint-ORIG-GUID: FJx5IKYq0Ie-4yXqkxHmtXGZKLikGvsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240044

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..9cf38a7e0b94 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2018,6 +2018,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

