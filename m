Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497808;
	b=ibZh8vs6UHJkoOdZQ6QdRoLyAG2b/am39kj36YTrf64tSDyqVTFcBAwFibE048EB8/6v
	 IO1GgFlxjQ8PG9AgNjQ+83Wrxx3yzQod7xQFi6O+8cUaXfQ21SoqGwxgkWcq5K4Q+83ba
	 Vv+UTDQF6Ioj3n9jWqqEgZzBDvHalwE6zKX4b7+EB77o3aO3/B3BLR9amLSpbmfsYOy+7
	 Fv/QCwHQzZ3W8zHL7P7hULtwykArewRFQJkRB0hQSs+yh5lyw1sUDk8Fd7leRGmH5WDD0
	 4KTsi5zXg8CvcuWR9xjrbfRbPygsJMNtmvzRI20rxK1vvvPR63eK5EQReqfMIZnWm5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=;
	b=sO9NwQz+XAl/s64BLpEhLglCkNhFnEkQo81+cisv2qERoQuC23eYNFIIN+hR+H8tADMb
	 c1AKsscnXm9bZzQ1aQamIw9x0NJ+tdtHsM98HKfX7L6aTqryykUG73HRJgsoiEJ6q5BGk
	 kaVy2LfkJh2FuR9OS62EoZalHf0ZoJ2T5vm8mRo3tdkTONpdoKM3o/R+2d0/wJR4RcvHJ
	 YfydLY0rs1WQJtIDSnZwrwehEAftuMJATrdu658WYAHG+6aDLvyzrjfeeyUcSo8+9M3eK
	 Lsbva5pFNiOTLT5Q0LjY+Pp8g3EHBdR+m5S/8O1Tr1/GRuDRXjpQWELrrSP3Q9b9v5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPup8h9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxQ8NT56;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C299606A883
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C299606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPup8h9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxQ8NT56
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaEKh1112675
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=; b=KiPup8h9fQVaDAtA
	+jJUw9V6fkLSzoBZJPK3oKE2P7AU5W67keThP0fq8zKk+xRIVJNae1BR5KWpeJ/l
	pssM8Ki8s8fr2MPU6u1bwb1aRPSNkNNOKNxJqGFgJ+m4Mod+087tnQocy8paaDQI
	/C3IIJGx7uOME0cmzCMAEI+BLVI6wVq7VyOjMNhSu+3OYpqph6AeeH3a8EKbcqRE
	3fBCifC8Mu6B3FyVc7r/xUgUhttdx/erP0gcQC5KDuCUlPojH5W6dgA/WbTs0GhE
	Vw3ngYT3aChUuUxWfWi5nlJRlW092kzZ8f7SGKhnccDMuymUMJ/2muE/nb9Hnq8e
	YJGZKQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re28n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d32175c486so678384137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497806; x=1795102606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=;
        b=JxQ8NT56mx5RC0me2fHeF3uT6SByozigitXZJMwEhM99MDyjC2jnGu53Lm70l6j9Do
         8w5aC5osS/86sb58LXrXwnFHGm6Q56kDnWWrnaOYictK2QBgauVLBhBW8KbJrkyIsgFp
         L3r9/ZmaIZ/xJSAOHKjK6bgN/rMZZCoEWq113EtlqqlsZVLCzV6tBT+Cb82c0CgmCIbw
         MhAtblkIUaone8H9RwurKjX9WPtD/N5gtUFZwOlEPQyFgFu3lGVvWJhne6gYN17xri58
         q97F7rC9QZpgFaosg3gbqsTric5gQxa/1qdm0GCJwSYh51kSBv/dxIAb6fW+5kiS9aJR
         396g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497806; x=1795102606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=;
        b=guBSYob/y4MMd4iKmJvzhgEz8Y5NqDAHLGpp9pnjn31iC1Y46dxmGYisWedXYQfl4D
         tnVAOxLTaIydOx7Cc/SYXPQUk54zFJi81BZzPG05GVcsgZ3xY2A6wQFwZYOsxwDHtW4E
         6ugKIMVLUmDXtX9026+ZzaZd+Kcby6EFLpbAhmDYpLIB2hWiJ8RHh+taKW2YJ8dwPfZC
         jPmQvOXLE5NvY1SvYt9ivi/iGi7tDtmo2X5H6DdEwknxMyKG319XjIb7CCobx6QvxBEY
         H+LjjAV34ULUxdXY3x98DqTU+AB1eiEYlAcSuAAUJMO9GNFboyeWML+ISoWzJnQbORST
         0UxA==
X-Gm-Message-State: APuU4Z+u8/eeJtUH84g9OifZuG3662xYAeVDGY/lLl7qUFRUIzemW7dR
	XCBiXC6gg1LXb31GQHwnurIfEQftpqqwWvYzPwZ9vOrPxpTbKkGOXMPVj6oxjwxGUFLY27co85s
	P1qgZk5xdpO5H/RxxOKDbrwuH6FVLyXSCN2MldN8xdMa89e/+lrXKNOHIsJrk1u4Inr1A
X-Gm-Gg: AYBFou0ZoQeqblYoFthMS5N8+bL+bCmhZ+FtI/Q93xocMayVwo6xljutoRg1cw6ipMC
	9Q32Ip+TXLq0O+gllPGua6OeSHpNSFkMTraU/GLu+RimCZiQcm5qsHysw1/IJrZte5fydYrBJOh
	JlTNoLwuo/kcsTysv5redOQDGPNkdTCD665ZjsG2k8uFMnl8WHlY5R+WELU3RQm9lYinv9Ajegc
	73gGs9D+429lYAPTmgq+buuSIMuA5PjecumdBNeJWhETa8XEgQIzDK2p92QLe3+HCN4LxAyUeJm
	ZLySJJ5FnlUPtuq68e4pHh29BNYQRgiSNZfnK48iMo7WkjjNyT++igH63+buDa+X95sD9XTH0ad
	ZodjXggvrEQKerqLNE8Rje1vzJ6PcZCd7FZsXjCPGC4ZZvi4WBZRiexibFzAS0uhJ99aCOzPtlM
	i3tA==
X-Received: by 2002:a05:6102:6a83:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d4fb2db138mr2027739137.9.1794497806364;
        Thu, 12 Nov 2026 07:36:46 -0800 (PST)
X-Received: by 2002:a05:6102:6a83:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d4fb2db138mr2027721137.9.1794497805797;
        Thu, 12 Nov 2026 07:36:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:36:38 +0100
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
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
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MYxtwx6oSY9pEafESek3VC8deiLRo9hu3VKNcZ8z/D0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0ITiVdJuWn1AJ9v/nPh87x/keI0+PcHah/O
 fojoOmerCeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w6izEACOL6wZcrWuKa8sIiIvcUG4OZNoEmYMS3cuGhOz7NFCzHWfQmE1ffjCEgwuZisRDIDbPIO
 nJDxiQEMJD2Args6Yxnui7TvXnyLZFRohlJt9m7oThnEeN18z6Yjh5YCHEDZ51H7y1Pg0+qhn7Y
 L2gSXyxVa9upebQxhHMwwcMejRWn49GZeL9JJQHjYILS08sA/wXEz+qFeDEQeZonC9w7nto8Pm8
 +AVtUckE8ibCSlIQ/crS9js+BiYUdGQn24EAW5maYL+FCtZ2szziovQNgovKhPktmkHmQ446Zje
 BoInuuZiFx/mdP5okOnNvnZoipCahdtsZQX3GTIXF3AkS+gUwz3C1oyg/Q9J2KToecfvUaW2lq1
 hOC2wK3CyCi3XM5lp0YlGQx9D7Q7LtGhHA0eDhYrNNpTlD89TlUP6Zm3JLlizkpAEY/SwJZ4pYJ
 J9/q14S5VXhh5dRI+qL8R3JIL1hPFH9bC1EWC95j3+Soegef5HPzw2XWN0AjavtmzvRE0rfCsZZ
 HDzlU6WvuL6JKiuLsNWRwFNRH2YLKU0rZBbDaxITEVo7McDtecBTk3gnmH9nyumQ7IE8AstmKpa
 Tz4NSS3H6RkYeebVKpMdS69rVfjUj3gpDViT59ZuwjoyCBGJSKTBQ8BNleeJd2j4C5z69vbJjkJ
 C51L7TkrTlty+Rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: u9jrVehRSDYxCOED8sMhgkLYUUIjo9c_
X-Proofpoint-GUID: u9jrVehRSDYxCOED8sMhgkLYUUIjo9c_
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5dd0f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2jpwp6DS_NLBz8rowOEA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX3x5nOARP+5VY
 OP0Y1vRSJdHzdQznFmWgnREUNU6L+Y8SgWlYmbwEWX+weRDiSoBOrcoPa2vnUayKyXVTYHwgh4v
 mEUZm93I2GETz4DDimDL8ufqbBaWw8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX3sHmKaoHqVoS
 iHssPe+/vf0EQD0sSJIdv9m4yzBfKWT69cICHRSMw0pgSud9JMnwKD1DIvRVPCGUOxxWIHHpIgy
 gqpZPAc+VE02VEPPFd2NwSUXEsNYoFwCs1eGGp5eLnW2vvka5OavHwT54NaCbEHC3hpVaibxvk3
 fuXBlsZ8bTu49AgIdZ32ZG7eG+StgPaWSlQTRq0mpgb+QyrDfib2+B0iUpOHOid6+wlOkiLBOZZ
 05KIGDnHEYvR7slucrj0/SJO9bWsHP1sdpvAlmc3ZmkBUNVGeKqdqCBGb3TQiKfbqqbBV/8lE5n
 MLQMLuzVgbwudk2Au+t8DORCn51bT18lJAfWp0FEup7q/XI48ytPz6TaFSlGJqHmgmf3LEaip7W
 z2hfaosSCHCe4BrIUxYSHIrTR86Cw5upreb8hURFErzi3hMcxWfCEPs4Y6yCIpjcU+8J9A2dCti
 NhQz27e8reE93qpYTDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120062

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

While at it: make the constraints stricter than the global settings: set
minItems to 5 as all three architectures require the cfg_ahb clock.

Fixes: 674e602140a1 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[Bartosz: fix constraints]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8f..8d09e6937fef0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,11 +209,13 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -229,6 +231,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy

-- 
2.47.3

