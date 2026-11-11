Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383533;
	b=ol1Jgwi2xGPAccrM6TAV+f5fYxHmY+sMPWM625JQ6JPJclPMaXhLEIWDNR6HKng8xOjv
	 RMujDlputas8DZkbT/kRmHhLHG4UyLmLto4T7A2r9OCaOog0L2H+KVGrGGnXYM6XEZ4U6
	 v/DxiEyfAQzmX3XzGqqJDKrrpncBEP4/B+hTlK7jHt0Ud6axymmk2+Rv+XnWvoOC/RiUs
	 9a4mGCOUxieQcGB00NGU8P3d3QzUiFmTOk4NTEp+LrwwPV8D2mFpPwzYNo1sr3mfesaxR
	 ExXIzb2kDtj4rtKOrC6eNrfPM/VvOQNkLsO+qCUuxgYaDcqQR0asCFJBgV9L7LT6omg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
	b=uwD3jsCbHCN8mBggHHZAVEMaLgjUOYIBe+mxXYRn6h2c8ErvCJd/xxYv+TzB1pritCMY
	 0Xo+pMDG4Bl5adO6Qh+080l4RTS2RLK3IjrH1VYT/+0B7/hgBjA9VdruLyGcvnFKQhddU
	 ZzJWAFn3Z4cv3df8jsYlZlsoB5MBnw+nBUIZtsh/whZsm8QS048Z8s/OofX01ojgWZBWx
	 jzAymLQfTe/d9V9eapnD0M1o80PJdAAiHqMUonO9nTgCQzKO2n7kpwHpDgcBZxjv5QDj/
	 NPXiWQZMcWv1Nf81iiH6j0bUtwemARB6eM1A1FcqA4Ps1L/civHcL/0jSZ/fMQSiHYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVno4fAi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nev7AnB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BEA60A2601
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BEA60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BVno4fAi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nev7AnB5
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5KI932350808
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xvXRY7fo9j2
	LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=; b=BVno4fAiNnmG9s0uDvJ3iioUenb
	pOuFvrfSgZIrh9VYDr72xGeP/aJNshdYos6SldlQ6V0IK28Cdz9/xWdSUFOutIOr
	uYqBBczbMnL0Mw2CUeC2UtjZItFE7CK/1mxkbyLgqs0+LhuvM2FzctytxEo0lE1d
	cm9ZFqoNmECNIYvE1zMVFo3liZyiqOJGANsDgSMy6M1DmL/WuPj1KJzJRPOUvwGP
	WrqJp/Xz0GzqhwIPBg4K7RV+trqbo7YOzHMHUjdpGVhLGFHnAZwokXe5CtVG3O+E
	Hx2HpcdB0E4yeybZka6YkLACT7xgmdC+9KFmnw00o8ubqA1B/h6yUvVfl+g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp1gat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:52:11 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36fa5673fccso1048433eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 23:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383531; x=1794988331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=Nev7AnB5+ex/FQ0juxOu6Alfn5FduvyFmvYyry+IEPvMA8luIED+rCkA0Uiz77rFY1
         vZLtIgN3AqmQB7mBNVHZ3phKb1sns2zoMBIMGIdD9IHnP4aM6l5L8Ajh5TTx5NEhJ/MA
         KwnWI9ueoqtOplt0Y+9Hfl0i4rKHen1NUV7pqzGNKVeCFsZGA8lxymOLH4363cYYM31x
         3kohYIpygkxoizmiZlG3r6oFGi7J04OaTEJB07bBdf0pze5qD5yWQ/epZkbm8lo0vrFO
         HO35IxHfM3/Oi5hWcVW+VIt7Xh+AWnkeEnFtHPnPeSuk9wzdsSynJklVJnZUDhpvitnH
         0v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383531; x=1794988331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xvXRY7fo9j2LxYwG9sASKkXrJG/YBIxwy5thc/SS8HU=;
        b=wl7mpNMQMfevITWbDUOK0PAgRp6waW4dy0HYvfHwG0hrH8stLNmas/z9A1viRuEH2U
         5P7ltaPaqSiXTSdgfOJpZbFbcqHCltRgH85+PwAXuPJG39RePcb0idcXWOr/DDdDlqJ2
         wmF93j90jnjCW5BPukGvHCJG+eTWePUlj02kf3JP7lN7mkhpZ1K/i12bL86Rib4K0xZK
         NcgpSJA5X10bR9zxLmkQEMWuYjZvOXRR/gNsSarbXZjSoTyX7aO85WxJ+QIbHhJG6oTB
         TQ1UO/n9ez2Gyhb4FauI4t1KfjWN+f+vtnYiNWy/vfYv371UHK38mx9dCkvX1XpYuReH
         N/vw==
X-Forwarded-Encrypted: i=1; AL+hErHlZUv9bwQpOB7xO+zqBIjVToHeA6XaIYp8rHztjUOo0BgFAlEv8Rvt3lQIQ0FfKfZs0a7dD/o7DaNS/QfL@vger.kernel.org
X-Gm-Message-State: APuU4Z9qJeCGZcFkoFGBybNkmQ5PoL3R/oBEM0u2ncQcoojLYy2htuGW
	OVX32nUk2TuAa7d+ky6PyGHmMma1n0SiJkT+a++jl9+OcC9T5eruE3xW6vf/vSXtaJNGeS9I//h
	9YmuK0m0Iw6qx1rtPLLTMuCyOigjN787/xbx2f80DZFsYOmmPBG8KY3KZKP5+dz8by4HL
X-Gm-Gg: AYBFou0p1UvmTso0r8ADpfx63ANR4SZzEzmgO8OYCIjsO4htoLnNdWpuoxjBU0uit3j
	Wf4kLEmjKrVhuZMNsHMwx7s+zrzGMnrccW2MgrFEtnuutQxPkMA0KRTXfxoPMsokPwD4l099Jmq
	peIbKf0W+BM2G2dG2Zw4XhhdziKzJU4xN4M1s3D9TGV5omimEor3NPQOxIbrSxhC3CMMirai57j
	r0eF1JMHDDSB1ePXMSwP3KPBLQ8INIAJtZbxyglXYjZFEpYFH2vxicHcyQpCDzD8NOTtuk3nhbc
	OtLgKbrxDgDS5hMeY1V3lNSfVGaZvO5TOSm5CGXGBe7LaqaEcyeIP3tb2wPF/OkxYGgcsklzcHx
	O5xVOsWUFSe7ygRZAwDrOfa/TdftvgmgCFQLGuKFO0ThMurT56hTTokjUR3WqjtgW9TxsvCUNl/
	Y6bKo1umjoo8NlefeKJGyKRxtEWGgdGyuv
X-Received: by 2002:a05:693c:42c8:b0:374:ea35:9069 with SMTP id 5a478bee46e88-37687214143mr2418344eec.39.1794383530846;
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
X-Received: by 2002:a05:693c:42c8:b0:374:ea35:9069 with SMTP id 5a478bee46e88-37687214143mr2418325eec.39.1794383530277;
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-377531d3287sm187032eec.0.2026.11.10.23.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:10 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 3/7] arm64: dts: qcom: nord-ride-embedded: Enable PCIe controllers and PHY
Date: Wed, 11 Nov 2026 15:51:37 +0800
Message-ID: <20261111075141.3710366-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
References: <20261111075141.3710366-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfXztxTjEJ6GHVS
 LOY+X2kejvw00+FkzYBzgAoj2CF07kqtEXLWu7G0A4stOOADVlerI+v3CGKhEXl3ZR0VEefznIM
 wdxN/f+2bMXu0ebdKN0mMDNxkJYVsbJozhRGBYcPx1MrV9hO1MshqhPjKie8ZFHLbXTLwkV/05S
 bO3mPOFDBdTBk3/0LWL7JLbkON+l+jUY4miOhEcelAQKJjzM3O6mUhgZnz4rsgwQHxc2oHwMlFx
 NOcYJmLnUzoyZtYo2bKoki8yms21Byn5LvROIVO4PjT30pBFZAaTST4kPGcT6IkczW+KyxoAZ41
 /cLPLrfThRBDsC7fDGEuUbQL6FXVauMLAzrKII4XnDHM71HxdJ4ZVffGXXl/6/6tpJn6MkV1xZW
 aqv+EDBTIYr7eerBiu4gem8Y+82dfwonPev9A/R2nGxtlf22TYDKoqp2iQGShj9rqoA026wpd5q
 WfnFWxSBtO85J1Nax2A==
X-Proofpoint-GUID: g6LL7voahXuF68SIbD-hnIAottVl9MrS
X-Proofpoint-ORIG-GUID: g6LL7voahXuF68SIbD-hnIAottVl9MrS
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af41eab cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ccc3-NsNM3ZFeKEqOdcA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX4Sh4VvcxzxyO
 x6ERLenCywctAnuJOvpmBDH/rJPyYt7hyfVJCQQcMEp/gE6AnIhe6QIqL8e81PNpS2m6HhB2smX
 /Mg5Aqa3i7wyQWGEDoXru2fr1PEUyi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

The Nord Ride Embedded board routes all four PCIe links, so enable
pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
describe the PERST# and WAKE# lines of each root port.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..cf760ec41727 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&pcie_phy {
+	vdda-phy-a-supply = <&vreg_l6a_1p2>;
+	vdda-phy-b-supply = <&vreg_l4a_1p2>;
+	vdda-phy-c-supply = <&vreg_l4a_1p2>;
+	vdda-phy-d-supply = <&vreg_l4a_1p2>;
+	vdda-pll-a-supply = <&vreg_l1e_0p9>;
+	vdda-pll-b-supply = <&vreg_l2e_0p9>;
+	vdda-pll-c-supply = <&vreg_l2e_0p9>;
+	vdda-pll-d-supply = <&vreg_l2e_0p9>;
+
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

