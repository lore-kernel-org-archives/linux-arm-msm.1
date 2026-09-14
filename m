Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A4488755
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390187; cv=none; b=H+iES93HFgieJ/PDFi+JbG9IvbTIvIM7PKXrvexIxWyJszcIUO++Xn7Ug9Juhq+nst2GTlcb1YTx22sb8V06c/C4OPcxU8RBhkLfAKWo6NUGn2rt47b+oMcjOuCohwED67niI2tSLeC21wy/aqPcL6gx0MIvi3ro1dkv1lLsmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390187; c=relaxed/simple;
	bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvSfQLPqQ1w6SKDTNgRV60HJwWvBJDiqub8A0M+s1twhszyXCPu1VSzhapOcq/92UizxyDjHbAxepTe4f87vt0ovBP+q86Lnd2R0hRoSflUvhKzWCSnbsmMg3Jn7KoWzL1MiHVDAeg36MK5u3n9uceuAdbTpFMqpdVvGpTQT6g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ti0BKlv9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgsR5DRK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ti0BKlv9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgsR5DRK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7lt3291532
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=; b=Ti0BKlv9NCVYVQK6
	hxwbl32ktF55RDeR/ph2JhZGh2USjCyvAVFPiMJ+qVDy1PdTaNNh6GwhYL1x/47n
	HeM8yT+N4vdTl7KCkfK3Njal8OXw2w+ua+zd5DFSDVryGKVWjWvLl8iM5AoHwdDr
	8+DHPst2+T7veRn3r4Vdfe8nmca4CybnUxpDMZB+6AqFz15jCv+H2lyJGuUkMMUF
	9CdwVSY57LxFQUF6G4fHSuHKkk5xTpa+2sHrcHT0hu76LO0C9nJLyEmhsntT95De
	fB4awCSY8h/bVpkAkX1f43n5yoAnHZ13Cq5d7jzV1+O9beOZBXot2OAoLeBd82xF
	qSBrNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:49:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso770963985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390184; x=1789994984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=RgsR5DRKiS9lTsammeuTkhpN0Bbw8GYbpA2btZcePM9D13t3RsRwCa/7N2GhVEUy7l
         D70H8jh70OchNoSJ37GEdVBj8lZwZcn08hj3EO0DuUdrZcGaXux88oXt3dM92CObHzR/
         ULgLoJUsOK8t0bSgnd4OxqmQ0Khtw7t7329HxOx4khDtMsUQ3aEIVf8Ei5rKaMuLtD5k
         JwNAVq/EvvbtdBb6stT+kJ2hq8oBVb1yMzOaakh+Y3eXbux5UE/okaKs1GrcPMk3eMst
         qnwI8+HkqIWS4hv57pk71PbHY7SGkO15KBigiWHzl7EqIaXScBazLnheUylHsJAC1xrp
         Xrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390184; x=1789994984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0kY/X+MNS8JUoHzSoVI1sINwBunSwLnZRh70or1BPw=;
        b=cw3SdqxmEG3Dm+p6RAHS1vbLjivQzek/+Y0CNDOzDBMDzKvr1/F5txLTbOu9+/uSOU
         kMWMniXtiRyGpn88N7pYY8+KU+0vyGIwd5stLx7ZTbwgUvGTfw0eHW6HnHz7ksML7KaO
         1DsGDQ8bxGlS7qQ7F9AEW2mnp+GhT5STyUX2fcUW+ccCVX7Q4BVFb+JgGJFHuW9AVHdf
         w7C4mKfxuxcCPwD9t3Y1nH0VVkkf09mhWCzo3EJEBM4/e5CuMxnc57rH/z4X2J+jSeGM
         Oyf8bFCuC4/a8EB6h7OqGPZuz1v/VBJ4P4j483T7tgy1x5Sf8y16H8eTbRkEXqBi9njY
         35hw==
X-Gm-Message-State: AFuF++msImbC8+JETrjwDJsTVL3ukHLg6Vwqz3JUxAtzUDEytA5l1S3q
	VyGF/Ajjw1Tldz1vST6qOuwFVXBz81N6NAgNHTR0exLRpmbeSc89mt0uOfsXUEepTGZztiASaaZ
	rO5Qx34WAoqSvIATaez9r1SVYVeNUzKliunFSafGNBOLumAfJT8Hg05tyvt2gI2rNKwrR
X-Gm-Gg: AYBFou3viDJjlWTA5XFRIHc2PF0jDw2Atg34bWmSJM9KOQT2R0kbXJgoMmvSPpoCuWu
	6FCkXVRloXV4YZY0+On/z7kUf0EMTa6PJdBv16RTxcVf4zCAe23zMITOxhrNd0hP5MuTXTsnOWQ
	Z9QQZCHQQZaQD2ncWd8VzEBe67eDRNS5Np24t14ahHzbbJmEUzKKqAoFyliuEnd32P1H6M0sO7R
	uZ2KeYHQsJzZxyiA5tmUT8OJ9LfaaJtWOfIspwcblvWF8k4k+/23neXz12v+hd6qrt7z0GMgRNt
	ZuqunZ2mkATbMjvJO4tR54kdMXKRfo2L70nrkuE4T8CvcQWFhQ+a+Qbafg3kWwY71p5nkwMInP7
	IEmUI7VLB
X-Received: by 2002:a05:620a:2697:b0:939:7f2f:b17e with SMTP id af79cd13be357-93a299491dbmr310390985a.30.1789390183653;
        Mon, 14 Sep 2026 05:49:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2697:b0:939:7f2f:b17e with SMTP id af79cd13be357-93a299491dbmr310386285a.30.1789390183094;
        Mon, 14 Sep 2026 05:49:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:37 +0300
Subject: [PATCH v4 38/52] arm64: dts: qcom: monaco: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-38-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=963;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SrsYjgf2cZ2lS+GknfUq15ipEdN7b+OQxw0l503vtHU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zwjgZu96fKVplDBLzthSga/G5UmcoMat6rr
 cqEWQdDKOCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs8AAKCRAbX0TJAJUV
 VnzhD/4/FAFDt/TkAX/I8GcLnRTlUmKQxe+xICXNqQJ9X2JEVz4wgMSBeksaZ6VDQmRAjvUJ2wz
 +lqMzhBhrwlq/5EdHejlVIi9Kyc3dJ7ZpmJ//KciC/LljxWryWE3nFJP9I+G3a8/bzC187f18NQ
 mAbtdsOEmfjwawBmPgVDTZHhG1cdfe9RwmgFwuVv7/o/qwOYZNBNUn/mkCDl5jNBtD7Xck4XgNG
 8yD2DtoNO+ZbUatdtv8e/8VmoBAzcVTGuTu6voFsemHVuRYz0N4/eW/Mn2nZY0GgwGFXWWCnoV6
 uDG7EfmdzcbEws+WI9wp2+9S5fRs4+hHd4HQLzonR0xpw48wJHUY230zfo8P/dgDS5krbhhTjXz
 hnyQ4PHpNn+XG0kx2WFUaxu5+k60w9a4TujQjCmNh01FZjH7G9h8BSHCcG7LOZX1QsEuDMFEktF
 FPqjE0huJQT2qEg7wbV0OzNSgWh6OnGop9rQs2sPVcWCIeljm5EkRkIyhmAFaQu/OWjnUl5XVAc
 Z97qkoEWG6e3YkKkjHM8wjNJlCS1sWIBR2aj8JDPD8OPAw63AUte2XtqXuIzKe6wE7rr0CO3tfL
 jEVTtetmILz7BAfxlcrYa95AUrViMmRMIe00MtzCQuvWCH/LdpxVW8g6tKJPijCi9qMlm7Wrtfq
 9a+RExpt+hnCIjQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed68 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3n_S7Wnn7mudAyu7Y6kA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: e5A6mLF4yW-f-Hil18Hyc1cNJAMRQNOZ
X-Proofpoint-ORIG-GUID: e5A6mLF4yW-f-Hil18Hyc1cNJAMRQNOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0c60sSgrkwxv
 n4YNyIqQLWlA/Beu2s2tHnboHaFMs+VJ/+sZYrvytb1EUPR1Zr26VJ4YIocMqyd9EE9ULeMLzpo
 jmL6IeZP2uJJXatTqUZLolmVOttmoT79LYob0jAYMT56meSV/fBo3YtVP3RfW6Z0CZTq05XPD2B
 r+gf2IQlgiAHLqcYNmh23zJ9DcZKBEpoPVZxDq26vZp/PaWxjqJF23b8XlDDcrxst3u69ADj8j2
 X8RgFQ1ordaGrFxOhn5lT5oG4ey7aSMGDC9d6DCw7+5OeFLUzxHU0IPxv4yknsTxcJ0LxESaqYW
 aXwEVi1Tx87amrWF9jng0s8jteaKESj8UYphPxZjC+gYJo0rsgOEe8qwYAOThHd7KKTxv5pFnWs
 ISStYlHpFnvkVtqPNZWaqBERkLUsYj128cTMsAGqoPv2+rTudg8SdTMe2yEzuHXp/0VdcS56WYb
 SNuuM2GXy4I/HpRXhKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwqWXJ3Gz8umc
 wpudN4TRvDDUZ0K27y4XWGEq1altYk/5TyUgSrjuX8tt2pjXPGJw4nyC/xSBJZvlBSc2AhbDRz8
 9O3bBl+Qy6ZZNhKa5h/8UraygQwr1Jg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on QCS8300 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..8478e81c4ada 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -897,6 +897,7 @@ gcc: clock-controller@100000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,

-- 
2.54.0

