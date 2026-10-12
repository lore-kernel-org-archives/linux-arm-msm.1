Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9550348986C
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807917; cv=none; b=sd9zFKSpKfdxg497rpVPLcCQJUFbEubHLMDuy5Jc326+VcCF719wIQyI0M8DW4KsyrLnFaasNVfywsuqELtuI6nnEHIMfFKIw28gMQlItCJ1FM4JhaV3aVMOHEvlsBi072knRmhHV2CRXSv3mpHlbPwivGN6OACNw0Du8ZFQh1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807917; c=relaxed/simple;
	bh=qMvLDhfMyDqTMFA/K6jBCmjnjVPhaYDWKb58UQvbTb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ejCg+p8h1t/6Fv1F8DIFLpT5DDIi+vjGDaQit1IepGqk4iYKPPcqLexVpbeiQITCNefu74Csn7Cw4oEGMrGB7i7l7/wGkr7oHoUfO+aWhxmdDNkwifv/Wwq6WhWfHADbwpBXc8mcoLaVJuT9qPygWNDraN+tkMhBrZ47KZgacUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KqjrS4a6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPKdU3H9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KqjrS4a6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPKdU3H9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03Eu801999
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ggny4io8/GeqFlUGakMUNa6HAK/BLw1aG1aVueMu+rk=; b=KqjrS4a6XTWcaK9p
	ThKpAvUEhhRc7wtxbcIMmetVLCAYcKbWlmGERBgmDnuh0KkMsDLSaW0Q3/xCceZd
	RBE7w5Hi2JuQ3hO5nnrepr0ohwZPCZMU3W327L7ZTW4u/yzkAWAENrjMbH3h75gt
	c0WX16OkztfudvY2ypZHykNrFp44Ck39ZkR5wG21lEc0jdQDY5fnfPbXKDfjII3W
	3/UI1DRa4fVnp4aUlO86n6xWx6kkmg5jwc8in3eRQvjPILKyAqyI5Yi0XeO/C+aR
	cYrv1jVJtDUuGkz0LS7Nz+lQU4xIxN0ckpg7BgeEdFvaRBTR/HEUhyBXeDn0upm0
	JfO48Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcrmtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:25:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-533758f24f4so5208561cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791807914; x=1792412714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggny4io8/GeqFlUGakMUNa6HAK/BLw1aG1aVueMu+rk=;
        b=WPKdU3H9JqYoMKGaGxztQqphmvxKOIXnCWS9KDOgUm3GMhhM/TjcMtMjHycDaL1Z3T
         KoGznHR4/KrFSQpcYmN8FsFoAQEAnZSbdQHE5eIjVei2uKdmLZIuMEqPiNA1xN+dQZBM
         SCOI/BEYBjM1tFzYfzgXoXjOR6RBcIyWXzwlmhq/FiuuY0MFkIwZ9RP3o2RRyXbKgLbf
         LxKHQ3WWoFzKuh658WHWQVJM3wuckZ7lwvvkkqUclOwBx+9jAg28IjY4XBcJ+QJWwMZ4
         Tt42gtDq49lsYhRNlRiIdD66hFJG1WU0dxkKj7CyNAIzH1Wn8Si1Z7g2uG3X/UPT7cvg
         Fuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807914; x=1792412714;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggny4io8/GeqFlUGakMUNa6HAK/BLw1aG1aVueMu+rk=;
        b=gxycdzYuj4iYHRpWNOFeBrXP9egtwlIRpZx7Nf5XRDm74+9uQwWFGdUDRyetGxlzVh
         QK0VsPRpZ6pJvdKUfNYyRi8UdiCtHelvlIGgVeqAvfzOmoUpbECWlXN0jpYqt9vvmR2/
         p/q+CE9+xhgwy5C6/ltWN1cEanNUpBQczNCzqrseiRYfJteGnjGYQ2fnblmDAeO1wCvN
         oz00VhVJkuZlpTgs5iQzTuczCzx4HKCf0Hn9IqPwiQEo8q8bV0rUiz9d4CqERbOrj+39
         cN3ydft2ShGtJ8emKa897PRCtCxqbvSx4+Gnx8+Gsu7pSqcRd7gUC7OTTzdZQJimpKq7
         DPtQ==
X-Gm-Message-State: AFq9FYKEH8gaUBMt5wm/6mcZ1BwP9EXQ8yE1VYML97P58UPFqcQuKY6F
	49FMzFDUXX02k2kzot/yq2xL6C1nAAKq7G5GlIHmjQnvPHA7OGjr5bokOIuh5HMQkgLvY7sQJzW
	JeAnT/0wSX145vWm15ltG+wYrF8fNbrQ6Cq90E9ANs3LE36IinYtvfOjUrhYEYykYsE8O
X-Gm-Gg: AYBFou1Acg9hqdBoUBkmxjUj3uSAO9eieEwMUqyYwJi4EmyE1EQITGbB2XTSZrBNMW8
	ALhx+JWTqZzrYBBCK7tKr2taV/lxJL87gAqOU1bHJcAbZhF2Def+VSmxBG2daAVxtIWJxLe/Sdp
	Q5pbcd4623+NAtdTPJNwBU5I0CA3aqlw80u6qwUUk88/7E7EMx36o5Y19E7+KAyQ8UVBG/LvXFK
	evExCHo9N+ZRFf4KO4aDwW+lskYdBuM83pZ+WgC9bB+orUGz1iTEx0FwKseIZ3cTv3GyRL51sbx
	kaiLYxaI+onRWJQj2p5GU8/lys4KfWsevghoZGX5CgXPtRr3YBcFnWblEmTeaIPUGu5i2vSE3t5
	P6E8gKmwNsdFgARCaJXRfrA==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr183745241cf.0.1791807913870;
        Mon, 12 Oct 2026 05:25:13 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr183744571cf.0.1791807913317;
        Mon, 12 Oct 2026 05:25:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c32a4954a3bsm320996066b.64.2026.10.12.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 05:25:12 -0700 (PDT)
Message-ID: <85e1c0ba-2c73-4860-b615-59fbe7745f22@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:25:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord: Add Adreno 753 GPU and GMU
 nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>
References: <20261009-nord-gpu1-v1-0-a06a6c57bde7@oss.qualcomm.com>
 <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-nord-gpu1-v1-3-a06a6c57bde7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qATYYMWzD-HspwO-sG7e9Y96uZT6zxfh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX4fpUc+fmuV83
 kISuoCu/S78DViOJiK/G+FkzTY1f7ARacF/2Tx/tXDTMbfuBiMgkFhOjMtDSAQdSjGEa4xnzmDB
 PO3ubwOkw68EwOCAjL85914nBbJzqUo=
X-Proofpoint-ORIG-GUID: qATYYMWzD-HspwO-sG7e9Y96uZT6zxfh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX72f9g41jhMrV
 NzSaqYBpT5uUY7BuzVWU9FJRnDSdJvopugIAscvRUfst2X4x+EeDOoFcqKSXUutCpdupJeb+axX
 b5ID1Sc6cLmy7Bze/WRHdJX1B8IWdjsNCrselbPZpjtODlUTptHmuiwjLH82Y0PpRp72c7xSdpy
 q0ph9l5PJkMl9QDTOFkUIon3HYjvry7A5g7MaGLUslkWwHxE4WItJyTwZ74QohKR5X2B3cQzWSg
 npihMCKPlObHcbL2e4GylzbHGJsuWSHeE7IirLCwn0QgpshWp0N920B73cQYYz6NLTNYBuXiF49
 xCtwHXADGowv4oixAZJUTFwNVpet70dxQBQ5y5nUZ59vZQLenbeeWPFVfpxGtwg6M0vyD5OX904
 6awK7V2clu287C90VdTCa3FYO4GRngb9EmGr5tcCDiZ4jmGs4Pa6bTeQZjAx8NovMvlS9lZWtXv
 fdN3JdYYCXPzXXjyLMQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accd1aa cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aFZ6yv5HFTEQG_DnIlwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

On 10/8/26 11:06 PM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Nord SoC integrates an Adreno 753 GPU as its primary GPU, belonging to
> the A7xx Gen3 family, along with its Graphics Management Unit (GMU).
> 
> Add the GPU and GMU nodes together with their OPP tables. The GPU sits
> behind adreno_smmu_0 and uses the gen71300 zap shader, while the GMU is
> clocked and powered from GPUCC.
> 
> Unlike previous Adreno SoCs, where the GMU AXI clock comes from the
> single global clock controller, Nord splits its GCC into four blocks
> (GCC, SE_GCC, NE_GCC and NW_GCC). The GPU's AXI clock,
> NW_GCC_HSCNOC_GPU_AXI_CLK, is provided by NW_GCC, so the GMU node
> references nwgcc directly.

This is a very mildly interesting detail

[...]

> +		gpu_opp_table_0: opp-table {
> +			compatible = "operating-points-v2-adreno",
> +				     "operating-points-v2";
> +
> +			opp-468000000 {
> +				opp-hz = /bits/ 64 <468000000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +				opp-peak-kBps = <781250>;
> +			};

This table seems mismatched with the clock plan

[...]

> +		operating-points-v2 = <&gmu_opp_table_0>;
> +
> +		gmu_opp_table_0: opp-table {
> +			compatible = "operating-points-v2";
> +
> +			opp-416666000 {
> +				opp-hz = /bits/ 64 <416666000>;
> +				opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
> +			};

The clock plan says that should be 500 MHz

Konrad
