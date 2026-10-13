Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457C38737E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881763; cv=none; b=uTYC3+Md0i0soMdtw1tRadrlhrN6tWQy/kbgj2861Hf97R3evxvMcmKBhF+ZCpTxCdxmIePfsPwGDpka1mHIRT1S/pglE5WyS8fMrY7FyCpX+2ddjNM+rZijUWoXtMyTPA7ZZ7xs19sjR6kz9w4QVwx32qz7U26O3xdy0WCkf2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881763; c=relaxed/simple;
	bh=Ns7sXp7nbAxQ+d9ppkpl3BkPUMeRUP+Unl8M3UcRmg4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=I6jm/ris6DcRB0pf3DwkUhr5v5eedj7nMmCee3RRDR3dJi3ulqW9OnNFMgis+OJzfi6K38KvmWK26TzuyRlCMyE87Uv3yWiN3NXYfgRUg+ZqbBtJB/7aOmXJwopzrVMjYwPmyasbLiYvUpywnHOlEzfsgnj2ac0KJm2YAJTyIK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p6XRtd13; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lz8JVO6x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p6XRtd13";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lz8JVO6x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Wl7O3055608
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1E+U/oCtiadEjBPVcmwlClbvy7oIfNbNlEnLfsUwqSg=; b=p6XRtd13VF8R5UFO
	LmNziM+b0wu+ENNRkstxyd0dhzpspd7TVK+AiNvustJviy7fdl/DyAwN60ijki2V
	NN3JvNvoBmBoeEajp5Re8cbm0bpDYUmQCpZv1VBV+8dorzqI1M5KnPywbo/bIN7s
	Efc8YYLavH8c7mimzLifowSjwn9ydJ9V7MXoKo3L1S56qCqSVu13OZplnDqUfddc
	nP2viXjv0GPmfpPQS6VKRgoHfg6k+U6uOZPSyFDAGHKn7hhNATMrJ35eg8AR1v4V
	ag3O03KxDVg+OBQHUdLXZHL37CFDgHO/OKGhVMMb1/qHK1iFMz5vB2PSDhEuSH+0
	RkAZRw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeucyx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:56:01 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso2494212c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881760; x=1792486560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1E+U/oCtiadEjBPVcmwlClbvy7oIfNbNlEnLfsUwqSg=;
        b=Lz8JVO6x6C+LqMa53lfu/ZS7u/j6HxMCuF/b0Frr9rLNICbV3g6I4L6a8DIDFYxYKb
         iYE5RemOQtAX8vHts9tHA8WGTveWbBradBRCwYNs3fORNLqfIvpAhEODPjOltTkZPxu6
         xR1L4yl6gGHVRC7iR6rJerNzC5E8wpCt+nQ6zpCWglMEq0+jzSe/yN2i1BSZmyPD7TmY
         g7ZEajTFdT0AvOsUXV8QrBYuqavSMstKyoFo6E1wG4zI+4rm5e831sd0j3A03zfRF3gF
         EZtmm8AXdztvRypARsPSbPqTGR9jjFZ1iG9Qc4auXuWDujeYeiOVN6PplZ6tn2QLl4Bb
         iYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881760; x=1792486560;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1E+U/oCtiadEjBPVcmwlClbvy7oIfNbNlEnLfsUwqSg=;
        b=Agg2H/Fg03t+Cs3SjP+RK/RWLnfz4yFvLmpVkfN14l9I2NJ58+vK5gVJk7W8NJLRwm
         zml/uXXpf2EqZwidvfZGWERg9CLzbYv+2M71RVZA6kyOoiL3SIa69uxoxDZrmXZm+cGX
         bKiiyf2Orhomcp7TU/WsTWrLNUAN1o8JdspX8R8ecU3YGbs1sZwPPK/3QWmf8vZHIlBK
         z7nfMgvhwHS1o6LET0+yaw3EVOfolYQ8xKhFrtTw9Nlx5R51SAvYOvyMSL9L8DSXYKnb
         zozpj9EyMBsZ1FUyl3qbcdRJ2/MLLIaqV6aj8mQ+OHD0ZoxCU/VtprITcXclP3N8U1B1
         D5Ug==
X-Gm-Message-State: AFq9FYIXVKrjntpKzDkoP4PWJBUPRqayzgAu53jqApZ5upM46FKOV8+R
	B1ikqDG3dWiZ00/A+8oDl8BBcpmUiDvMod2aRxvzAHKE7eNZmhSpLYkT5Pe9BJ7nL3/0ezWiQaL
	FafmxLriz8Ub9s/finjWhqvlPtUrLU5Z6Brb5aLLdgBZI6FUdv4V0zvGDf7VCxAAKes9a
X-Gm-Gg: AYBFou1RA9FFpctc4qPI0a7y7+XGhXrWIDy6NwS16kGoKEOAeibpayZwGClocvtaw4L
	8x7sUyJRHf92Pk2tVwyWUvGZ77/UH7dzO2G7rWgWY5ka7Zb0PYcjulnRFdLkhaZa6K55gaitF4o
	+Hl8pnW4bqdXP5idThGiJ9129qOoi08f4Xnq8v6kBTizhr1cf3I0+GWGAuY9v90mGqVSvapMdFr
	Q83VkDj0ALYCiqDujHbTWRihCKKyArSNIy9vhe8vZSj0lmYlO1DxfrQg3rPMPBDZJzHdg7SMOp5
	aqSnn8YE50EGSMwJLXOYtjlqAie7MvDHW418dnTmMIWoDbugYxo75nZtyDOYudMznk2ppz2OdgH
	ypF7WwTnaIGLjinbZQOg48zQkhS5FDw==
X-Received: by 2002:a05:7022:b045:20b0:143:297c:276c with SMTP id a92af1059eb24-16a61d5c036mr16486805c88.33.1791881759724;
        Tue, 13 Oct 2026 01:55:59 -0700 (PDT)
X-Received: by 2002:a05:7022:b045:20b0:143:297c:276c with SMTP id a92af1059eb24-16a61d5c036mr16486775c88.33.1791881759046;
        Tue, 13 Oct 2026 01:55:59 -0700 (PDT)
Received: from [10.92.214.125] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm37363656c88.15.2026.10.13.01.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:55:58 -0700 (PDT)
Message-ID: <f283d47a-8f37-40e1-a7ea-2fd70d2feb5a@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:25:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Add support for Talos Lyra EVK board
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C6TPapmNWTRMMolFmxKJAuzzwFDT_E8V
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdf221 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=to6Cgp3UGnXA1T4zeqwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfXyMp6Tr4Plk7G
 HAbD1mjE3obD3zPiH2PU7GbOAxOAhXyp/Hi8fznAzFm1J74XKB8hf/xvvNXnmCQq9Db7+Dz4jhj
 j5GHN7JTtVwkRUTc1UYmV4eKCtwyCIM=
X-Proofpoint-ORIG-GUID: C6TPapmNWTRMMolFmxKJAuzzwFDT_E8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNSBTYWx0ZWRfX3eNyc6uOYzqt
 xdOBJcNp8bB3JhRAq2y6jUD57ZAu5RPwnZmvm8u21EpvpOoNzTYmZX/DK7E+Va6MTAGM/ocrwjF
 Ywah2Kqe3NrNQggo8dZIFVDTZYw68NoLU5Xji6EShiaHXemOKgWo2bo4yeD72QistgOsvP4GNZI
 8/0p3n6pmGM2cIOeFk4qzgDFE7CM3dIEZD9UMEB3cvRxXKg5x0pVV2AO8n5u0cWaD4e3Y100aEq
 9EEK3BpWx/vLRqqACXH0IXGfxdTT2qObcFHrYxfYBZUlKEpISPFNN1ZvVoNoLOWy2Kfra32EnkD
 81BR43GDJrcxjvvpveVQtvTBWRePI5efrmv/S7GOUX5PizlO6gHd2CJ0yOgulbkufEqcyRXkP25
 LO1tS+PDVqhUQEEtnPZC4GBsz1zi9A4TNa3eW2AnfwxXx8Cr4Dx0UwLA89UQv5zxbWVj+I8K+fY
 Qz4aWK/7l6WeiZCa74Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130035


On 10/12/2026 11:46 AM, Ruchira Revdekar wrote:
> This series continues work originally posted by Avaneesh Kumar Dwivedi [1].
> V2 incorporates review feedback, validation results, and subsequent
> updates.
>
> This series adds initial device tree support for the Talos Lyra EVK,
> a QCS615-based System on Module (SoM) paired with a common carrier board.
>
> The Talos Lyra SoM is a compact compute module integrating the QCS615 SoC,
> PMICs, memory, and essential connectivity. It is designed to be paired with
> multiple carrier boards to support different use cases.
>
> Talos Lyra is a distinct SoM revision of the existing Talos EVK SoM. The
> key differences are:
>    - Adds Apache (Lite-on-Module) WLAN on SoC Card.
>    - Removes SPI-attached CAN transceiver module.
>    - SDC2 on the existing Talos SoM supported SDIO-based WLAN; it is now
>      used for the SD card connector only.
>
> Changes in v1:
>    - dt-bindings for the Talos Lyra EVK board.
>    - Talos Lyra SoM DTSI with PMIC, regulators, storage (UFS/SD),
>      QUPv3 instances, ADSP/CDSP remoteprocs, and GPU definitions.
>    - Talos Lyra EVK board DTS enabling DisplayPort, GPIO expanders,
>      SPI-attached TPM (ST33), and USB on the carrier board.
>
> Changes in v2:
>    - Drop qcom,talos-lyra-evk-som compatible from the binding; group
>      qcom,talos-lyra-evk under the existing talos-evk block instead
>    - Remove unused regulators vreg_s3a (smps3), vreg_s5a (smps5) and
>      vreg_s6a (smps6) from the SoM device tree
>    - Update board compatible string to remove qcom,talos-lyra-evk-som
>    - Add "talos:" subsystem prefix to patches 2 and 3 subjects
>    - Set initial-mode to HPM for all LDOs (ldo3, ldo11, ldo13, ldo15, ldo16)
>    - Add EL2 overlay for talos-lyra-evk as a separate patch (patch 4)
>
> Note: The WLAN node is not included in this series and will be posted
> as a follow-up.
>
> [1] Link: https://lore.kernel.org/r/20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com
>
> Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
> ---
> Avaneesh Kumar Dwivedi (3):
>        dt-bindings: arm: qcom: Add Talos Lyra EVK board
>        arm64: dts: qcom: talos: Add Talos Lyra EVK SoM platform
>        arm64: dts: qcom: talos: Add Talos Lyra EVK board
>
> Ruchira Revdekar (1):
>        arm64: dts: qcom: talos: Add EL2 overlay for talos-lyra-evk
>
>   Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
>   arch/arm64/boot/dts/qcom/Makefile                |   5 +
>   arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi | 251 +++++++++++++++++++++++
>   arch/arm64/boot/dts/qcom/talos-lyra-evk.dts      | 137 +++++++++++++
>   4 files changed, 394 insertions(+)
> ---
>
Tested this series on Talos Lyra EVK platform. The board boots successfully
with this series and no issues were observed during validation.

Tested-by: Nirmesh Kumar Singh<nirmesh.singh@oss.qualcomm.com>

Thanks,
Nirmesh
