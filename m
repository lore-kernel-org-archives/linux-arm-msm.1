Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501682;
	b=3JYTxVihSnD325E0nG87N8to4w9JWRi2/365eKn1iI7VWjvY6CXNtTKiSmFCLLAqmgxN
	 hDhtbFKexg1qEYjzMD94+BoepRP4oeP38DmxZCZdN7pzNOJ6QnWue8U3cqsprn3TrrBrO
	 TMkzvmtYjg6YOSbEn2Msg1QIZuG8x76ML4zVNEHybSZAxtJptZM98Wc+wATNJlwvW8q+i
	 0GQm3n3xJeE0aVI9fuh6ASOxUvQsTMPi9VBs51HLfZ9fdo7Gg/VRuVKH5QVzXgl+XbSy0
	 onqOaHIpqMSkHD6iTAzZechvfi9UEij+VEj7YB50uJlQieS6veCy+UFeoUx/s6D3ebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501682;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GL1KW5KmlCjKPjnDBxCpHXDrPADkygTf7Br9pvr+Mhg=;
	b=1PLX8tpNI92PnFrL8BcSkpq3R++J2PTlymw8k0Wn3pxEA4GbhfV3nelYoa0XQNOHm0Fe
	 Hgo4rqVincN5qbl/LAJlGOv1pgTz3LxzrJ1onMBq5mue/hUR1rq78FKMS44gr/0B2290m
	 WTwmsMsSqoPkgklo3gl0JLEvtZdReewB+5B1owPZmKTnyPaA4vhh9HfwQ712BdmeHuhZ1
	 pwFcwXrZ8IGo3CbBAscluzDIgrSZGE9Ut5uC+6raLQCnJTfrZW4COoCnmx3Q/BCpRMcFP
	 DUKvr2tsMBXewP71FDmPb4DLIGq9tj9PPKYacJl+mZrEmVoIoHo3evgPyuAlR05ofQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnSSx0vC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVbGfz6J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FE9606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gnSSx0vC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MVbGfz6J
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZO0B2593680
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GL1KW5KmlCjKPjnDBxCpHX
	DrPADkygTf7Br9pvr+Mhg=; b=gnSSx0vCopJj6a6qEas/Akf07gbKgrP/P850i9
	W1cj6sdwAYxJv2NMv+GYcgmCgqHx5uDm8gzd4psg0b9nUQEG3dlhy6fWaQziiRlH
	S6qD00YRtAdlgUDiN6YWV0pw8ih7X8ZxeN+GRt0XhF/wuMAUOGxzVcNwR+ATccvl
	IjTnTpvRK1kFjtSgwYhXeK4Mr/wNmZiLKaxFvktjFdOCxCSikkoOSFA5j9CWj1lF
	idwqaA4YhQsA/pUVcAKme9LhRS7II1UYOya/UWu5U4bp/jIv/Dy3KulH438jZLzk
	RUD4HwsIeIqO0snUWSIxdZv20ufCgMFoYPAXDw0/R8sUp+/g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx31anq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 16:41:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3425098ae4bso789192eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794501680; x=1795106480; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GL1KW5KmlCjKPjnDBxCpHXDrPADkygTf7Br9pvr+Mhg=;
        b=MVbGfz6JDrTw9U7ir5GlDlM8lDQiJ03anvTYV8BwuwIn9hlIso9ssKkFwaAscZsA9S
         XRwkJU9/7gtE46J1eiANdttz9c/Sd4C5+0YTrg9N3ZgbnW/1a521OsMvkhlIILGBWYSC
         nLhInkkf4bPMGTluuu+4Mln5dZGwQHlBIrhgygcH6S7sNiMlcjq6tYr2bvCsOVe4mhwG
         0+WOIQmNCluioT/rQXEN3WlYrrqK+TeqgdFuQZx9x7wMH7rpPBIqN+1WWiz3EFLWnmuT
         hximC04CDlRaD2S9rKiUOsqP4lX5FyiCGY8bBhPVetJd4x2sPt3Qrgdi226qGtjL8Ac4
         CQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501680; x=1795106480;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GL1KW5KmlCjKPjnDBxCpHXDrPADkygTf7Br9pvr+Mhg=;
        b=uMVtd7Tp4Jl3GjaPk6vZcJ6B4yN/E9oaX6XYVCyQ+1Z8R3f67i+v58KpoUdUwCu08B
         LgpkcDVsWAvRXyKzVKx8XlwBZprT3g6sCt6qpMp/4PdqvtDnlZdh1Tw6+vY8NLZGUGNx
         8jmRTirL48bIrh4beNxkJtGHsUxQO7pnOVM+WereXLcLG7ag7XJfml4Or0UPtImRtfpL
         juTMoKjU/OuWNRh+sOY1V3hNHMUUW7LNZRgxRfrQ24BssHBr0uqUb8Y5wSfmuGYTqLDf
         oXfyJ0rim2lrwi59Sf6cMR2d5pWYyyrOzWb8nBmCE83zRrDTbfPQ9SXRwdjhOXso9D9B
         5BLQ==
X-Gm-Message-State: APuU4Z/Or4zP/OIxxUpG1ywx2ZuGp3OF7294h/LIICw9NRNsgr1VSnCH
	iyL/+Euj/y8XFAN6MJ6lhWmb2mRks4e9GWGiSgQEuTNv6zOfg1zHZjgaQzt4cq20tVvyHRZmxCr
	f5swavCajxNGGAMJGRWiDetVingtCJZmFUVbMgBYYTlORgdEH5WUHeBL1MPyfgOauTtsNX1Sh+N
	4u
X-Gm-Gg: AYBFou23015PAQVeIGPncozpDC+2pZukgzW29nMxXfsyDuQzc/ZguUnoVFdqRFRmJjR
	tdFUTF9oZ9irDMlBwV3umBpHds45eVcfVbk20SwSnFk+N/abSiEv6KxpELFfoLBM/cpIzUmKQOB
	gE0J9DRCIoJrYmTud2o5Jfliadk2c6nY5vCdqilzwt6PuaL5XRrnrGgDAu8kQsDd2P0IqICU8Dr
	T56zHeYlKUCc0naz0CKwhWrW1PN6wq2zhOJPypc9oErw3Fed7WUw8nWp3s0maetTqRNP357xXG2
	ZkfPgwBujqWl8NpYue/HnJpL9DU0G7BXyaH4iobz/SE2tkNMsxjWYHx6FuGGQbSHqjDUmfaA5uo
	edSOmW4fVsL7X+9zDRrAjcONiCuvh3EEpevr6Stx/3R9NIEd01BZciLL6DjQ7Zj1YKwF0rbbj1a
	liLRgG00o0
X-Received: by 2002:a05:693c:884a:b0:376:7640:9668 with SMTP id 5a478bee46e88-377e15f05a9mr2410069eec.19.1794501679062;
        Thu, 12 Nov 2026 08:41:19 -0800 (PST)
X-Received: by 2002:a05:693c:884a:b0:376:7640:9668 with SMTP id 5a478bee46e88-377e15f05a9mr2410044eec.19.1794501678408;
        Thu, 12 Nov 2026 08:41:18 -0800 (PST)
Received: from hu-sushruts-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37926255ad0sm779194eec.25.2026.11.12.08.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:41:17 -0800 (PST)
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 22:10:51 +0530
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Disable PCIe ASPM L1ss
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
Message-Id: <20261112-rb3gen2_disable_l1ss-v1-1-aeefbf366595@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABLs9WoC/x3MQQqAIBBG4avErBMapRZdJSI0/2ogLByIILp70
 vJbvPeQIguU+uqhjEtUjlTAdUXz5tMKI7GYbGM7ZrYmB7ci2SmK+rBj2lnVRMDF1i2+dZ5KemY
 scv/bYXzfD/shr4JmAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794501673; l=1435;
 i=sushrut.trivedi@oss.qualcomm.com; s=20251127; h=from:subject:message-id;
 bh=hn8E95hSjnp4mo9evG0HYYFRX9Qv8JX3XUrnmOB8URY=;
 b=Cz2hIbb7SVbY6DLNlsZUI/OVjlbb4XaMXl9hWDZtzhwGhSNGzadgtTvKIbeI7iS83xcN2+Bg+
 twR7EFHpjBTBUE2YW9Aed5R0eCRreFpaOewszGyiNXXjzDzyQcYUB9a
X-Developer-Key: i=sushrut.trivedi@oss.qualcomm.com; a=ed25519;
 pk=OrUHTxBaSg1oY3CtCictJ5A4bDMNLRZS1S+QfD9pdjw=
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5ec30 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=laLeL0i8vuo-D3f-tOUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX8zLUXZp+x8a2
 eQ3kNJAh9rSJg9eugqd9uLxcVZ/QaSsMTWd4sN9Rg2h1kz8E3Q2tPUIn3hsicKg91uvGZDh6Qz7
 MfibGczDgp/Z4bpQ0OmSlmE7OGdKBFBAYbqjNatFxctrws1f1G/JvNNbjI34jrx0Oo+EAdXSGGb
 t4t034JpbEfBkd4gY7O7nLfvLrIiw1ShJoibyOvrS6m0fEdxIYJhnn39GshKv3PbcII1xmb39LW
 TDVsTVWir9ky2xYo7wjFcC3ZEUglDJhNP4yqlJGiX9nbs1iiR7+qM2ny0zSDGqOtN8CIiJeCkQK
 nSaDXhdwxokZ0a8Uq8tuPRXQQiH/8/cZ431QBogGUpCg/jeO5nNf4McOayNbihB5o0v3bi10DPn
 PEN4+7E+uMtOW+u207D1yQga8j0fhTjLn/6FeTaNE+ofJwFBfYco44gKefAN9iyQavi/2DhFnGv
 nx+0Rni5dS6XtDI/w4A==
X-Proofpoint-ORIG-GUID: QwJdZwd4cSqtGvCWfLn2W7owMeGkO9XU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NiBTYWx0ZWRfX5cc3eIJhLBFF
 km/qlImQm8+j8Hnj7UBCHO634fxL3BTAFvTUXdCkJ06yBBaEv0FnlXogEMs86B6lC7SnTKzoMBq
 Jj8vEaHn82u4N+gaJLQYZfruD5xEw6Q=
X-Proofpoint-GUID: QwJdZwd4cSqtGvCWfLn2W7owMeGkO9XU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120066

On the QCS6490 RB3gen2 platform, there is no mechanism for the
PCIe endpoints connected to TC9563 switch to assert #CLKREQ and
initiate a L1ss exit on the upstream link between the PCIe1 RC and
TC9563 upstream port. Hence, once the upstream link enters L1ss
and the Renesas uPD720201 endpoint connected to the switch downstream
port tries to initiate an L1 exit, a link down is seen. This is
expected because the upstream link is still in L1ss and PCIe refclk
is cut-off.

To avoid this issue, disable ASPM L1ss on the upstream link of TC9563
switch to keep the PCIe refclk always on.

Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 909039816a21..df26c78e8a8a 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -891,6 +891,8 @@ pcie@0,0 {
 		pinctrl-0 = <&tc9563_resx_n>;
 		pinctrl-names = "default";
 
+		aspm-no-l1ss;
+
 		pcie1_switch0_dsp1: pcie@1,0 {
 			reg = <0x20800 0x0 0x0 0x0 0x0>;
 			#address-cells = <3>;

---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261112-rb3gen2_disable_l1ss-dee3d53fa53a

Best regards,
-- 
Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>

