Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795666;
	b=YuWWdKWRMDxNp3ibDltkQRM/NJ4uBaoPY4J2DsbJznkOX1UuHOE8hs9LMjoMF+tfaPYJ
	 HNqSFLpgweOOjAM7bI29ieCDfkjHKFHk89Xs7eWMdxORZpNQUdAn2BYKv8driUjqtgB6E
	 Q36WY6cXhyAxmrfcUBYCN8Q5j9lD+4IZGx/IJj8SwvzptLDIPyvn+Ek3H/pj4Fqlpsj8/
	 IFKcXbRBEwbmB/VIHat4YhyGeFP1VajyLLLxhq54+nz9AUJ1w0NwiFvnzGLb9Rnl8ZgtQ
	 qed+ubYM/m6ozADSV5WKrEuEtHaDxuSk0stXjCETPtraJrPv4Nnr8jJuXntaSeModbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
	b=vKMtZ7ZP0trUo6aFQN0erNU+zFvxEw5/u/Wsa8aGFp45wLyaYBGsCWII/m1GegMqP5Ci
	 iAUS+aM+q1CdEIG+4PF9UaNnlhOqDn0Q5st/j0EP0fLoEpKoLek3O0N4NJw6nkq4tlVe0
	 Om9TMkmBf5NL6Tova9iD0FiAi7WdBRCsRZb2JWitmVmnNDLZzDupH+mXQVMlzuWxUsPXP
	 yo6Mf35y5C+c2ETj46gcEKlz5M/XT+DwVKkjBQMvG74UqXUHZfgv6+3jP4Y/9VbT4cfWz
	 U8FijHwK2V0ZsmhWvkstx/WL9oWgvpOvYK/dB0u3cEbLlC2Vrc6A/OsQUo3dm7Z1Ngg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2A6T2L5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B8606A33F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 749B8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fiAXSHT7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P2A6T2L5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp5o82337932
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=; b=fiAXSHT7Y1boPPhF
	Qg23XEUKsfDzWY3hMqhcosHPiUf7YXbZeN74E56z+YS+xLj/2bXojzTgxvwkWuuV
	5/WvVrAcqZ8KTIvCjgKg7+bUJ/aIQTT+dD0DGR6MDoNPCiF1qH9z64mIvKedZEC/
	YW2b6Tdx5kpvxZGyWX6d2k4rFpXWn2MKhyqJpltvnEyeEMr+5WZUBSkmE0vzr7rB
	OVqDkQSPbPLUl49EsYKI2AzE2t6nOrWJ5kCDUn8+/OI/0cl4Qh9QbjMz1Tblr3Jb
	bJ+tT4yxHLcsB5QxsX5FItbc0N9n8zZqS8f1P4igEtFEWoJJjqY79J43+57ColUb
	Wov+/A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756ka11m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:07:44 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b3ad09ad82so106061387b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795664; x=1796400464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=P2A6T2L5ISeFsDzTFECAQUrZmshD1ttqWLne6rt6D3ymrV8BzX1JAwgEvSPW5dPZdn
         ml17BA3L3T2j9jlBffahloyD+htYxSTxRllU6z823V2sAG+xnW0RcTr8Tsu6U9oKmySa
         e9sFhvxm+20eS8v0FmsSv7CCfIUpOWc41YVAN+svQAYc9Z7/adRTprw0Fc/61rYaaiR6
         qSP3NVGl8InUImBjqQIMuGaVi+3pive7QTQezh5j4h3SqAAw0dNTiuWBU5h4spEITzRw
         DlPlRVyKp65WvcPfvmVfL7uSS6+ypxx7gsoMSa7Nx3FEysZ6+OzvA1/LZi7a5spJlrMu
         vRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795664; x=1796400464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDve/dz+oy8svKtS2MdOS1ixX/cP30Dbme7NV1o9tLY=;
        b=B4L3mBxCL1hQQXck83SzFM1I/z2tQC3Zptjx7hbffF/9pLqr8+ogoXJQYVvtQc8jem
         j/CnV4KECz1n+HwZ7gCXNa8r3dCbXXWUI+42GbXjf22AKCBJUayN+2DLpxh8kpTJIzB5
         VA+boaSFFs0Wi5lnLQwJZAMH7NMSNK868qXAuxzNWxzNiWFHkg6h7pW1f9eWySOWcuUW
         2zdPYcJoSUosDTkhYB++8DW2gsnYOBjJLR0W0FbVvGvnpECBGuhR/VnG3iOA070J0Fwo
         OkW6DCVZKtxVD901PNOtVKUwgvzItXU5hL8tj+qyU+oZvEVcSB9IPBgamrS08/XpSA0S
         HApA==
X-Gm-Message-State: APuU4Z+S5BhOp4AxQPZK6QDbu3r+O4gWhzQBMGJKVQhliSIjb6SdKEtO
	DCNSEHFB9ueJ+8pHWn7KZv+J1E9Bo33aWxsLg+ZVrJmCg9QZm8fDrwoF5mD9Roh+hXeZQjOOyIu
	j6M0FunETzvoc2o8qEknLABNvY4eE6TFpklvc3UEmsBe/cfUWhqq+gQuwH9XE+JG3HNFo
X-Gm-Gg: AZFdTZeTOcdyRj4znwmiUr/LEWDROLaaCgWUTz84qeb4jKww6Ju4UoTpIea8kC1Gv05
	AaFbsry7yqRILGMnqd1OkTD7Ek9t7+XYKrRyuMXEaaAEOWebJcDJaGmUkmVT3ZMw6mtPbz472sN
	rcoJf8rOmPVgKnQ1JC0UfTqX75l3B0Ad9eYZpReyiU4CKE2a2kvsD62letG/q0u3Ac7Elxy0ljO
	xV0IKR7umD6c3ryqZcD+ZkxrDBBosMB77xI20Iu1lRW00DEMAT7AA6lD0E/Nr0DQFXuX9W73ltM
	a4TvV4lrAMz5ku43NrmVwQUZiFOYNsa+zNd0HTtPgWVadvIQOtKR/UVEDs0samr4OVPy+EslzFL
	XmOxY8v6HvnvDvLdRURTtJbZWzWBv1dOnZoxOqDF0SRFqZWDW5P49RS7mRyx6XkENQgPWgtY4iT
	1TfXmmGR8/7SQ8cT8p5J28Q9kAORH6c61lzq6cuCJeTfx1fY1R1VcWn8BfjsWL0AU=
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100633227b3.47.1795795663508;
        Fri, 27 Nov 2026 08:07:43 -0800 (PST)
X-Received: by 2002:a05:690c:a89:b0:8b3:7782:675d with SMTP id 00721157ae682-8b5204d8021mr100632857b3.47.1795795662990;
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm46623137f8f.30.2026.11.27.08.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:07:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:07:37 +0100
Subject: [PATCH v4 1/2] arm64: dts: qcom: lemans: fix iommus SID mask for
 ethernet nodes
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
Message-Id: <20261127-sa8255p-emac-dts-v4-1-f0c5a95cc6c0@oss.qualcomm.com>
References: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
In-Reply-To: <20261127-sa8255p-emac-dts-v4-0-f0c5a95cc6c0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5XFVjff/QR80SQLKKFqKe3LuP6yj+0SGfsOuiR06Wa4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCarKvw9wSH3FLno4NflMnR1+eeMpV13hBh0gb
 u6WX/rlxNaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawmqygAKCRAFnS7L/zaE
 wwryD/4rvgx/F6iajtGvhQ/lg7INvhEWm9d7ZcpEDUtKR4V64LidQ+FH8nRtH/d+BJElALor1JE
 C3yx0ZFQ7ZvDQbQlp4TQsPRzxOCa7TCtbxtsxO447c0utky79Uk2erAlFGY5JbeRb3SEBN+tii+
 zjnCCzWncmrjlGCtd5AkBk1edKUHTkxNeoHGP3J/i8mz848Uzzl45iQF3pEzqedjTsDSPRw/zeC
 09JjAECH9+qNLaNmYFhqO0NxV20oUM9osat+tvXhACZ0XWFGgiVYEM+/HUIt5+83Vd5vVMGWB3Y
 7ORw47S0hxGzBSFzKl1ODV8pNSaIvXcBwR4U3GRwpMUc27UelBUuouyOrqducPyaH3Fc4Et/nJY
 u9vm+b7nAS4U5bmGz9UUA0FEbTVOOi68Ky3jTY6uhoiehiAQJ5q5te7Mq5dtkIK7e+1Q7RSGZaS
 AC/6d4NsgHYtioQ1c/kBQ8WyhuL4XSSt9Q4Nqr78GQZcdwB3goxHYWlnhewdazU3P4fvGo0nL7C
 g+40+bs+Jo3eWd6g2q8uokwshW9bYd8/i8/+w4lPkSLfRPZ5ZXursq3kpLIY1F0PWXRA8X79Xpp
 9Evywv8L6tbmLjtfstTc46H/7+7W3vv5pOXDo3n9KMKU7ZAHP9TYDIXnIQID/1venTFw/EkwO+i
 AmGbi7vUoxKKDMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX0H00W4e2t2o+
 U9cTXMFOEUJ/EBJBQODFbLZQXXFmFRQtuWeX29+kRW/fzUR/tDRdZbBl5DHXSzDq6d8klEl88va
 Kpa2F+L1E0hHf0cHdFHN2oIYjhGc3uIdc9pr2xyCCq9eNj0MscuSzmP1/8ldsYnuHatRss2Z2En
 pBgAQr6iotYL+M9AiU549Fgkh1D+cEZmi5UBapNlBSw8qoU3uaBtmFx1QwcmlHgZEBbAp4m3s9r
 FB8uvJyTyb3Vudo8QW+cEO1V9waghofpCzwg3iockt27l2vjhr3YJtaiAPYQI3MqFf7JuGZj2P5
 x+8gvCS6IXGK6fK5JO+jCQW4/XX8Ktu0GREQQkTRe8GgTCED2fXAfZxp2s7GSo+O8CJzqIMCEFv
 Y29+e0+61NSYK9b7OsnCXB0mol0kpvDhcOH+1VnAw0pmXDbPukjL4xDqQyncQF9J9Yk9Cm5Xm1x
 GDQ+TiFqtIEpX1scAuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXzFueCbhowQW9
 0xLwcsgdOlpWw22yXnzy/t3h6ys/TEPprmwifpyGmUfYvZm5TL2qesNNnw3q65mpT/YdEO+s+nY
 I8UNemvU7/mJbzmHYh9jDQKMT/6B6jM=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09aad0 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=jHMX-OgH2kBFWhD5V08A:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: iX2BN8rQMRPOlr5E1ght9vER6khRS7r8
X-Proofpoint-ORIG-GUID: iX2BN8rQMRPOlr5E1ght9vER6khRS7r8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The iommus mask for ethernet nodes is wrong, it makes the SMMU mask 16
stream IDs per MAC. We should actually only use 8 SIDs. This has
triggered a crash on sa8255p after a boot firmware update. Use the
correct value of 0x7.

Fixes: e952348a7cc7 ("arm64: dts: qcom: sa8775p: add a node for EMAC1")
Fixes: ff499a0fbb23 ("arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc4519d10f3f0765d0d6a54aac19b3..4e1755a7f2cdce07c454329760cf9a1a2b6b3977 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4401,7 +4401,7 @@ ethernet1: ethernet@23000000 {
 				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x140 0xf>;
+			iommus = <&apps_smmu 0x140 0x7>;
 			dma-coherent;
 
 			snps,tso;
@@ -4422,7 +4422,7 @@ ethernet0: ethernet@23040000 {
 				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "sfty";
 
-			iommus = <&apps_smmu 0x120 0xf>;
+			iommus = <&apps_smmu 0x120 0x7>;
 			dma-coherent;
 
 			snps,tso;

-- 
2.47.3

