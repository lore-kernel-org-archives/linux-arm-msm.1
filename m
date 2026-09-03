Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E393F7A9A
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418176; cv=none; b=o4Vat13he83mIo2pprB/6S2FLj59TbJmQXBE4AkaM5V9ileYfsgvSvuhWq0B6WnX0mt9yLPm9VWI+qnzWgD2JfxRSdVF6LBLXCC6FUmBo0qhncXxD7Fy8agSrkI2kHK48T9LW4OG1hmtqnx/Mb453GfwhaO8M8ld1L01I4jP3hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418176; c=relaxed/simple;
	bh=8VraffC5BKkejHmJdMksu0LpOfb2HU7NmdH6wjOmvrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aiv+Yclzksr4h5YCJUjtSfm8/icrZLnRcjErqr5loGD6z88OXXc5Ih4kKNy6s5AiPA2PbctKr0dfEAinU3MObqctPQHDH9/j9pTEmBleGETs4ZItiuh3qDrFVcQf/LrKlve24Yk2LN9xTn1RNAcS7+LA88cRbXrxC0sHbHQjb9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blP2OOD+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IsjXdd9o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blP2OOD+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IsjXdd9o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lM7l324624
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 06:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=; b=blP2OOD+OBnEz0KZ
	dil2gbYrbsBizldaMvz9GXwB1tkzZaxB0DmqxJT/NtTsPeEKG5dIFKY7fb34tgEC
	HnE0OOhDZqcTTznCMJAgLRLeb2m0gEmRcMAk0op4ahjKHYil51FYsNVCxQptoN+b
	XeGOJHY8zT/HDynjAQ25IqjviJcnWy4gLrdt0yfKw+JMOJHYqpYhTcBN4DwI1FSY
	hvpZWw3SdEaoc0A0gEz/wecMOEpiXTW96poop/fH/30uE4KBB0RSk7So/l9NrUZy
	eUQtSadHAzZ183T67zM5QYUbxewZoNzeFlzEP9emxAHUpRO394MUhEWwFFyqcZ8n
	hEK4Cg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnawwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 06:49:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so51480785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788418173; x=1789022973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=IsjXdd9oKkli6B06cJTrfgkppKNadjTpvhQh9lc7nDpSHQ2fSTbTrZTGv9KqksaDpc
         E2AlWdBgLwfC0k/cClcevtuFcjXlQ43Lcf/0wH/9xQnQmtThm+PnaKbk2Vh/n/RLhvtn
         1xNbyPmvwN0ER2E/lw7fzmnOPxdGsZfQp6E3dyDPyA+276VHRGJMUmpmvGI27jEDTVCf
         7OKKy/99GZYZqSojuzdaSGPD6VxBGg1S8PvQytng0VSxuT1/FF23ePbBBEOYBko4/GZ3
         YQzPoPnqBYiMhNsUIEBY6i9VyzuqyFB1AtPEjYLyk4OO4vOpugj0D3VG3Erxw2f8r5a+
         czog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418173; x=1789022973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lFCKmyK8dAOrbMDfK/y9bBG3LydVBne7sXQVgWJrSN0=;
        b=dF+DQ288iLwRTqZe8sUsXBRhjoAu5e/9coqfDiofjVBpTgXJnvWP6xqns1nj9j4BTn
         /rFJi4KrCfqllF33O/z1pypvHZUuBQeR6h1ok/RDuqtPZnLWm7Lw+iRAH1m1htwgqznG
         Zlveb1462HfEFfdqatDharIp5+Wwd1EJuCOoMk9rQ+CP2yBgPCjggOfNvt8t5VSBbABZ
         d34aJCwbNIDL0Oq24FmlDVR3WTT/LmrZZlQxVZREwDeGHpazAw9MXM5gCEO9/3JgN4eY
         oIR+nytWw6yHwrwfA9PLr78PCEj0BZwTueGZSTUiMDJoQfGad0psbOKVZp0otLnl4uF8
         TzAA==
X-Forwarded-Encrypted: i=1; AKwUvBzOijImKiiIOlEYu8ZPTSs5q0eOGd+e7iCsW0snrU78d0rPoP5nFec6DtWpolwijY3TDGKy712KJ9T4IlcT@vger.kernel.org
X-Gm-Message-State: AFuF++lfl6zmSlVarNrcCRojB2lcYU8TORsO0p+no85Ft7+go0tRHn1E
	kFkdC0Oq8p79rl6s7cNWkxLCZzXjiNAnwMVD7wgo9B01Zu7uuEH6gGanAtXy9zHsp5GTYNQe7W5
	kNJZZBmv/3zrqfhA9CLLwnyTsorSLw76ZpxelhuU4AUVv+KZTncurSRT1/SpzjtvlT6XE
X-Gm-Gg: AYBFou3+3eCmPY63jB9nS9wxjzJ3kQ/TC+9zXqbshOf8d8URPtA+k76u1xGPDxN2THZ
	6GpNGe+BMe8CDwYIadVZXV5J5gzNomRBOE9MwkuU6L8nVFlUW7NhTXLxpyqyH5ibb0rm9O8hIP2
	d6WkZ8EX9zMNG5L47mobnVbDcs6Q21Wfyu23uf5/+v+La0lnxzcSznOpMe5vTnkZ3DuUZdohUS2
	ox/8HpXUZUeQTqm764zpk3fTxD2XjE1WHYQRjy4Jir98DUKTlag/107PnRqoN7hHJHHnIZH80Kc
	AaiID1XO5uxQ0PIqhaPZAJ1P9TInCg/0YOZcynfJzg7BAC35rRP8pK6BefEeiVlHjipw5mjCl9R
	vozp4YP1wOggIPQuR2VoZhA==
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777139285a.4.1788418173371;
        Wed, 02 Sep 2026 23:49:33 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:931:23a:83ca with SMTP id af79cd13be357-93961007ae2mr777128585a.4.1788418171248;
        Wed, 02 Sep 2026 23:49:31 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f895e14sm1779131a12.3.2026.09.02.23.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:49:30 -0700 (PDT)
Message-ID: <91e5c863-43cd-4703-842c-7bfaf2de877e@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>,
        David Heidelberg <david@ixit.cz>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        oe-linux-nfc@lists.linux.dev, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260902-fp5-st21nfcd-v4-v4-0-ded2f1c501be@proton.me>
 <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-fp5-st21nfcd-v4-v4-3-ded2f1c501be@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a99187e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX96WLr71Zw7Kc
 62e67TVVSPa4tH/4tyBNyPqUL2md2+1/ooWJdSdjkbhW9e3o1AR6AjpQ+7qdWX4sYoBcuu+A+rJ
 CN71WSPBq3Fwq+Jph1NO4rbGiKduT4o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1OSBTYWx0ZWRfX15jQcfncbukh
 VAf0gPDiiM43+2rD4ZRZQ0VmCY/gXqQp3FgO0Dgv/EUiT07u+WbMLCgxIuV458KEoQjfm9rAcCP
 LbPfie0tU9NvoQFXsn5LhIrse5rm6XYGyCMGq+tx7DJ2ef80KxFp6W1Ey1qPMWjYnezEBra2ydU
 d5UF8gH/v0uIfHxtIWjkx5I9U5FwtiNrt4Et/2c1xm+JtAnKrHTHz7WqCU0gGVS1UYD4jXiDwMi
 QQkpgMUfhrOWgd7lAg1GbqpzA+Z/XWlkVvHDJZ6a5BzB+2AlU0oSPdR6WE8Y4OAXgCqqWF/bmDJ
 UU9qcNVj5PLt2janXBoMJ3hkoxrJXI+M3oSMaIr+qJC61EgT9Y81Pdq18Amh9umtoK2bCRnm+f4
 ZdR03jFJiOu7q7SO2ZyyUJr/nid8fTejrtY9QpFdMgNOHkC6EbHhQltw8dDaL8qRAhJPK9Qa5m0
 46EpGrCs/PrBpm+Bubg==
X-Proofpoint-GUID: Ypb4D4lnYxrB7gktPKScVIfSDp8n_xS6
X-Proofpoint-ORIG-GUID: Ypb4D4lnYxrB7gktPKScVIfSDp8n_xS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030059

On 9/2/26 11:22 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-low. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
