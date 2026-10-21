Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590709;
	b=M7IhxEH77CEWkXoUrAEqpf+2pXucog4g+OfbhPNJ8NzgQl/LeUCDOlEdpk86PypPgaCM
	 0me5h7bryeLsONWBXOJ5FjMyLPhBqNYIUXgS+nLUcEStesEdRupbeDnCGST5KGnLFzpKI
	 fiowKOVH/XlI6vyDMMlQV8nkgi7z528jxUtIQ8JcGzSHDEI5i43I4J4x6S4RzQI9OAq8g
	 Xu11EJyGCILYVtsaH/3pelYq00P0zGNykJQnG2xsBApgTTeQybsLE74oQICLoqALfB+YB
	 S7RkAgYlqy4ZlCbWqcs80p7NI9S5YzvoDQ/orUs5mLCtJIzl3l+hnRVlGG3XCPNrAkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=;
	b=X5OOSq10m4rrA9un4uY4lWb7IQE6dpgQuNSXX0y9oz+WsuG20Z7jy6aV260gqMo0oDdu
	 NYYxiPD2EL1sDDe3OiRwsQP0bK+eJc+cZ6WObB2iQ6CD588bNES93EDcktSF8t54Y+zTA
	 KTpBExEneCjB5aJgpRrs+2bg559MjHVkf3bCzvLzNC5iaATaCFvoyApfQVQwidYrC1dZP
	 R1aSnReJXyZORlUgeG1IyvvdjXJONNgWBJQVPqqSsxipfOSbLk7GAR8RVJtxMLa7x9L8H
	 eJ9+n6i1wTDnynFpV9V4YRYE2yzmYg22S9rahee/IJaJWDoAgfJhkb3W3BxW7Aw/11Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRpM+auj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N6Ak0N8X;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8840C60A2625
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8840C60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRpM+auj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N6Ak0N8X
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgPsj4168178
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=; b=XRpM+aujYckvOMNn
	5+yu0Juc7EZshslGjkOahJVUO3kw+BGJJapxZTP4nzSvjnpdR2CqwSBaCJkjiJzY
	LhN6m2vUwjdUMpCnIS7Aj59CtnYdIAxyfiXAOgyl0o99la7byAKe/Tg6z7D/MTqt
	Pc8G+pcgwp+za4Zdt0moTyIoD3pa9uUG9jopZx18l6E+uCBILuECexSkucw0QDaU
	fvjBNP9ebEOflRjZuVA0bzlwIaWNUvkA2i1QPFBAHyAkhhHiAhZkLan92YgMXpKY
	y8WAdunXzmyd+DodUh1xg1lg4BH0Fku2s55XVePcCwKxxtCgdXnt5PhNWy5Mtbyi
	jLww0w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m7hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 13:51:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a04491c56so819201eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 06:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590707; x=1793195507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=;
        b=N6Ak0N8X/KfFSyA9/PFHAryf3Rltd/07WSOoVG/lbuu6WM2NuiX/sSkZgBRV0aKvj9
         /p4MLYqELiZmER9HN/ftkyMJiWehdJjLmiQsWfNJAWkUCB9g6Z4fh7390bGGsbUxyg8N
         TG9MpRKzeeJGqBHRiugjTgQ222rygcxb6ujXEa05kzMmtVwmXPiLegLPaXJBnciX7JvT
         ximpuTFK6j/yi3VEgKbEhQi+0FBUY+ttCXXyYBklPrcdoLgdJiraJtYPgaSvat6grwTr
         9Ulvfxb4MtjgHBxWtpiDpC+hinesN3DUKob1AvMYuKKLY7zdFjqMNG8gk6si2c6oFDMQ
         tRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590707; x=1793195507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVWsWBCRMZYjSHMs8vlsyzTh7G+H8wKUyi8fgvNpbTw=;
        b=lS3DYJwR024aHRT3UOqVOKLOqe2fUNB2pvwg9x4ynVVCeUXefJ6lRma6x00H/v0PN5
         Vu3CpD/2C1fGtI4+AvktkqxIqn37KX4ZEO3xBdfF2otFKel2fS9r9aFBJjSOEz5mCUEe
         hNiAabv3+3neMV3wghQw0YQHSYLHAxDkr0GX/INtgsJIYtYs/uLlANu4KRt7PlkFx63g
         Jc/Zy5lP2e2RWBQesCLnnJiKQRb+9vMrV1KCmiHM+TNP+tkuwNjy9Il0BIh4rjuTwKde
         UZ29KyjwwU30YfXUOvKk4K+mEoaWw+jjEMNhCbYjGlaK+wuPViN6ggo1qa0kMj2wSC8h
         yC6A==
X-Forwarded-Encrypted: i=1; AKwUvBypHQhgyd8BQUrb9joOIM26GklxYya93hQMwLhOgaoiMcUjyJ127SDF9plRBS/7pk7PY70FR5PAGJCX5/o1@vger.kernel.org
X-Gm-Message-State: AFq9FYIGbmJRtKF0l9s48jA2ErzjTXMOxxvrWr4OoqXYwonMrqK8mVbe
	ZMlu4Q3Vb8wuME50IM7M/2jnb1+2d/BeyJbZ3vvdV/mUbbGi9fwPd142lQTYPYwjt9LZUeLydf7
	o2tFMQDsMO9O+NKdKblqNKWHPXmfIbdeYfdEMVA4qUr78JBTnz67e7BHymrZUSxq0u22M
X-Gm-Gg: AYBFou2RJKijcy7pIUyMHsT9urZYge7evLwVCn5FuAhN0ez3+mgdXa9DpguKN1cWQX1
	0ycCsLhVSX31V1vXdVbMwHhD/pzCqA1xAQjyeMMvfHO5vi1iL63d9sBFUgqqnCkSsTs0+uhK53y
	Wr3+zp/fH58sVwpBlS6rK/lVbp4HHuZumv8Tlt7x+nKFUq8nAzLNVL6BRxre2ISHIHF0n2bJN21
	CDpcpDAtcoGoZ2/RnOAQ75ozhXP7bb+xy3Xn9u8Np/BTrJSp27wxjl8yMuUlgZWerrnx3Oja6WW
	ZeQd6iaKRVHPK3t+k1fyqFqAqcBwnGuDVupFlRM6nLrrz+yvHsTaT4Q+ygI3M1+W5V0hQ9UbKgN
	0wh/HizOdLEoXw9dSH7256bFxN1pWheN0aA==
X-Received: by 2002:a05:693c:8801:10b0:353:7f47:8168 with SMTP id 5a478bee46e88-365fb187594mr6216837eec.17.1792590706944;
        Wed, 21 Oct 2026 06:51:46 -0700 (PDT)
X-Received: by 2002:a05:693c:8801:10b0:353:7f47:8168 with SMTP id 5a478bee46e88-365fb187594mr6216804eec.17.1792590706367;
        Wed, 21 Oct 2026 06:51:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc848fsm7534332eec.13.2026.10.21.06.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 06:51:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 19:21:24 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: glymur-crd: Describe the PCIe M.2
 Key B connector
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
Message-Id: <20261021-pcie6_fix-v1-3-ad37134c35a3@oss.qualcomm.com>
References: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
In-Reply-To: <20261021-pcie6_fix-v1-0-ad37134c35a3@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792590686; l=2234;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=N4sUA81o0uvR6JdRpINVUf4MY/Mr1oj/T6BQ1Wygh9o=;
 b=Mdyqv8Zf06NuraQphLE0x8nVr/anXhWSoGzD68/+GdqDV3SEHuXyw0N0AGK6CGE3tJDTk5X/X
 0f1Bi/Acn5JCklLc75L4R3KL1umI5ACEtsxpwIhEWvgWEfm5OeQcGnm
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX3InuralycJAt
 CSKDIHyv88zH1Pnw5S6m9LcRI/HPRVUEgqjrArPCIGnvRvR651YsXfrV/YsaITumgMsKEIvEt9b
 rhZHVm57ZBJi70VOwSLlZkmRakqZY5/9o8gN9Oy5AlCpv51Ke3y1gmYSD2ayvgJJagW0UalcuSK
 l89lUtTcFvg6locJkplinb0AIdJHe5LF4pQDwmCtzPCH4ICvdS8ik7SyG4CaWGgO4U23SvQscFV
 aNZZIyaPSApbQDu1gOzhIb2CeMxVhW9qGYp5wf9/Kn1J4x7FIobfc4Tt7VDPlVOPqpcQLxWBdoc
 GrWHdAZmBCrVir3Tb19OzA10ZlA/8lSmn915ahte9CjauS8uY/0hRE/GtAHXwIeg45Rk2wzbXu1
 XVzmLApLiYxM3xHItm4TlGciiLEgS4Txp3MdJfaHOI6LM6N+5/O7Zl/BtkyroN7kbizIJioShmh
 4doQY27Q8q5vqncQxzg==
X-Proofpoint-ORIG-GUID: 6HpLvFRRtxQAjeyiMnpILjdX923ga9Lv
X-Proofpoint-GUID: 6HpLvFRRtxQAjeyiMnpILjdX923ga9Lv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX4ETMs39W6qlt
 rwb6brWHfuy/cKkIAGJTqnUbKzDegCj0HcxxYgzKOyPtumpN2D2a8phT3OOQK3KRoowdR+lRSP4
 4lVKKpCxXAoaRoFKy5E7joNmqmYoopo=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c373 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210055

The Glymur CRD has a WWAN M.2 slot connected to PCIe6. Currently the
vreg_wwan supply is described directly on the PCIe6 host bridge. As a
result, the supply follows the PCIe controller power state and is turned
off when the controller is powered down, regardless of the requirements
of the device connected to the slot.

Move control of the WWAN supply to the generic
pci-pwrctrl-slot/pwrseq-pcie-m2 framework. This allows slot power to be
coordinated with PCI device power-management requirements and keeps the
supply enabled when required by the PCI device, such as for PME-based
wake-up.

Describe the slot as a PCIe M.2 Mechanical Key B connector and link it
to the PCIe6 Root Port using a graph port/endpoint pair, as required by
the pcie-m2-b-connector binding.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e27c697e3170..73de60b0d0e5 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -237,6 +237,27 @@ vreg_wwan: regulator-wwan {
 		pinctrl-names = "default";
 	};
 
+	wwan-connector {
+		compatible = "pcie-m2-b-connector";
+		vpcie3v3-supply = <&vreg_wwan>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wwan_m2_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie6_port0_ep>;
+				};
+			};
+		};
+	};
+
 	sound {
 		compatible = "qcom,glymur-sndcard";
 		model = "GLYMUR-CRD";
@@ -810,8 +831,6 @@ &pcie5_port0 {
 };
 
 &pcie6 {
-	vddpe-3v3-supply = <&vreg_wwan>;
-
 	pinctrl-0 = <&pcie6_default>;
 	pinctrl-names = "default";
 
@@ -828,6 +847,12 @@ &pcie6_phy {
 &pcie6_port0 {
 	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie6_port0_ep: endpoint {
+			remote-endpoint = <&wwan_m2_pcie_ep>;
+		};
+	};
 };
 
 &pmh0110_f_e1_gpios {

-- 
2.34.1

