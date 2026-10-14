Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E742455620
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960079; cv=none; b=aUYQ0y0L+6A/rg39LHswvagFKWRZ4BDYOYpNQM0rB649fgGscWU7WNM3IpZxgCYhwdqbEeRmbLrjHEU4trrXRIdmikMeBz1gdPt7a1aPRu9rqCeOhnyHUGDmySUgEyg//Uk+2qpma3FodfnjSnUw582zUW+rR9rXMSH4IBRv9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960079; c=relaxed/simple;
	bh=JEjls+AUhDEBzSl1ZPW4WOgZahhSkF3N27UnRS9UlAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKyA6dDX5yz+62+MftsHYoJJnFYII2n6+2YFtvdN5xWM0nNYt3c1+x8ExrWaZySTd6UwwMaSs1kWs+VoxCWHPVYVmVb8XlQMtZiLI4YQesWB7PvLxuYsQHPi5/DPtZk8wcuY00u6m5KcDzWIeXht4Q9PPiw89MryiDN77ZorCUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvDyXmu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWbfHBKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvDyXmu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWbfHBKr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E67il52685304
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xwb4/DRPYW+
	UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=; b=BvDyXmu6DqKr7z3izPuxoJAp/tS
	zJcl+6ODjahf6UxsBFJGeMSL0xRIM/8EX/+yOrkpjSFcMngpIqmRPNzuYqGsZ0oi
	FImenWl+w0sgQqkNEjl1LbUlQMp+PcLjfOnhSvSGnnj5iV6z6y4fXg26InMPxtBd
	l8DmHU4wbqE+ZjpURmoE54RyB9KfT+bZyKv/3Ff/wp8JktgNc2w5Ld1Oxiiye0K/
	UiIMzhL+UcbpUdzxOe1NybTe0k2A5wLjpHftdKs1QD5/oSmhrkJ3cFoKwE++5kkb
	3Cli7E25KDVwjS0dOov2SchVrcDr5R7iAusFIS0EDXJNZeYejWKE9PWhLYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u04cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:41:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88a1de72cf7so5292658b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 23:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960077; x=1792564877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwb4/DRPYW+UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=;
        b=UWbfHBKrH9WONMvovHR0+aBk/FVmMm0GGIsagKob6vdS4MIc90wCrcs1xVbJ1jGJu3
         IWAz2ZZgmGztsI+gXTUu2CYzE2KaEVHsxzRdynw5qdxVWanvJfV1ns2KpP9PtaY5z7EE
         vGnpidzWn/G/YF2EUfLYKVGRVnC9kd1b4f+sfaIOWrrSawTjKtaDtxegCD1GFc6jLkaG
         3XGSTSUjpAKCrU9rCk+IFOLIiSnWQDI+uAp8xLUiTDCSsgzQN3fF8MRE2W795yurEzGT
         9ymYYZaWKEstoTazy25t/VEKQ98GqsBDJRYImnlzXshkrzt2UtZSXGgo3hsJY5dhBafQ
         sxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960077; x=1792564877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwb4/DRPYW+UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=;
        b=qDYoSlNxSf29yi4EJsrg2/krghMlmm3QbTgegmGFNi7CmRK0n1vEEa+r8vG1EF1G3W
         p8yZGbd3/pBcO9iVfS59i8VVHTyYPLjcA26+PqPgl74Gg8XvuovrbgJVAkITblxOO9PO
         WqI/xK4mookGzuDbboUI8/vf8jc7dBUUdk8BW0XztCZcOj7UcNLemJabcIYgvXjbZZn9
         986+dpnubYlPWtQneYFWriKRHgsPunuj1JlHMTbomRgFoucRVFGizh4reRBIT1Le1hJe
         4exfGrtR+dXK3M6smZVQvV6hflKho74Bo4aATNTe30irugdxt70YSAL+VOESDouph47m
         Ynxg==
X-Forwarded-Encrypted: i=1; AKwUvBzYjLIz+wsDz6QxbJuAA8ceqcHv6DlgCupVFE7wC+pyM9u7sbfvfOMH/prsYBv+bUo6aEcjshU2rSUIH6R+@vger.kernel.org
X-Gm-Message-State: AFq9FYJEYeQ0sEZ/5onCSif3d2hKjwyTEArM01t826uVK42FV/Md8q0b
	XSKYCQBWyB9qOshirm5wdibJtmJVxmnfachfDhH40Eonk+tfs11zknc0pxLaIBdvBMZyNUrrkJE
	WBprT0YbcFrYUGQZh4Q+ewSaxe2J/qmsUU2PaW7QDG+u6y+Z+P3r9PiSlRIixg7b/clHs
X-Gm-Gg: AYBFou3CcH5sr/YJQFOpQtjEsaHDR4xWR44vEMcRUyHR9KvfYtJyQ+4toag4oaiajsM
	uhT8uxSITyLb311Aa/p3Wc8WSSquDHaCjQiojcNnfIa7n3BHamwQ98Q7C4RqURt59fyvL+K3Tl3
	5hSp6TPN8kMAmpXTrJM5yUX1zpj7aH/EmI5EfvK1/3Nnxw4STDLf9WdcQn0ChVEvxd3l4zDcRhD
	w400bOi+4yDYTD46oaVJ5PBV99TRdfXraNnRqM9A5rIfe34s5fw5M7AhGkceYJ8QBaZ2fDCKsyl
	optmYjbFu9mkxcq7hQp+x449yFgDq4wBUYF/H+feZSVmtNPBb3c3JMC3ulPTJ/sLqZ0Z5N8t7tA
	te4cGPHlWMzowtxwJN7x/qqmuqNmO3GSnNO9/9qNHIo1mndZndR1xMa1dVNk=
X-Received: by 2002:a05:6a00:7442:b0:880:8fe8:a3f5 with SMTP id d2e1a72fcca58-89695dc56camr7771649b3a.22.1791960076830;
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:7442:b0:880:8fe8:a3f5 with SMTP id d2e1a72fcca58-89695dc56camr7771625b3a.22.1791960076334;
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Wed, 14 Oct 2026 14:39:48 +0800
Message-ID: <20261014063953.549379-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX730FoaWLm9/k
 epSyNGe4KEwoHi9+lY5VaRoLLqGMaAemR04eYHqgvLBfqB2gd+kV+ATZlm2fxA2v67TDLLOSk74
 eWx2Is6FPdT1xVK0EWsVXkYYwZHjENA=
X-Proofpoint-GUID: 4VHVXv_3xwJEpsxfsDwzmldKZBGqwSlx
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf240d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=QMtlPPnfQmPOGJbtzYwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfXwQWqF+NUJJFy
 /1kYz9JylujzxeUGorUY/vf64661OJlH5GoMXu+rbM1FKyTQfNHaIfReyarUs+lHCge7pYVFL9m
 7al2imdsVsU+9WZ97uWKSqJGPl4QTJZ5KQhwYrm+wus1JW/bFRB5OcAIqZGYuha4EDUQ0iVCf1R
 DntEF4pz4qmwl0kBwD+aF++xlxXbiBfYTgIZYL9IbKgFvDRb9VswFZNP6jjVzT+uQ79UMsuR1K+
 /FSrH8lJvLp67gcBgC5GfQ81gcdiJCffhcirdLCR45tCcYIpDJ175EeamFqdfQXUlfv8d+pBVKo
 TvSaoAS5W+lPobHFUpGSAqT1P/V2DS4PuC5WSxIAPtVFWPGDHpmY9nxQ1tB7Y2c2XenlWq2z9ea
 K54don72RTnct0nqrQfkFo4hphLdamTPldpDiHdXnAGxLaV5EGTtUsL3aJ1acln8RAOzUA47GyE
 xaIngjeGl/FU7u+LUBQ==
X-Proofpoint-ORIG-GUID: 4VHVXv_3xwJEpsxfsDwzmldKZBGqwSlx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140026

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..0b0acd33a2e1 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0

