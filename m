Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EAB466B70
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849849; cv=none; b=UXGMPoTT6xFq7reNfW5zAj7QzfInprEQC6GqlCSXOL6wMdwZ3EWQTKa1W/h4GSST+QlzvsI+FF5q1wlsVgu1QJ41REc7kZ4CZ4aUNtwnGtx8D6v2i6izoPce9Tk9D4yOD3/cd/oGDJjFvaMkvFo1OsON+//ZbcylNGLND8nSszA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849849; c=relaxed/simple;
	bh=qEI46zWGvj414rMM6lTChTcs42RUxnnFlPJd8dnMJx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiWrYEOWv6LgUARZ6gucHgQT++euYs1z6Js//+6DK8OKlZKzoCQdSIltiqAG+BwzYLsFykKDFvks1viy7yDdpMgfDHoNUyubMsorh3o2cRyDy/iDnTMiT6uC4pdUKlpkZOSGvAJ9dXtnrBPL3hJjojLCVGYHfnEz2CMwJE1HmOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=arQpIbpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Szeiu3iO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="arQpIbpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Szeiu3iO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbh9n1310852
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=; b=arQpIbpcwtLvFFTN
	viG3nysBDMW7KpAs8xxPsTGsyxFADHyXX3EraVSEpdGbOr2M/oGljNT5of0mGiFl
	moPdZmBWMTs2LjM3dswcLvfLq4zfCaFxgK2MGfGTjCaKq44c/q/+WqihTzp/tB+w
	da7VwsfsMVx7YDgF5rTNwMpp5OczfG3dMb8gFdzKAMcPIIWdq+gk2Bs7/xZIsOwv
	8po/GXW4E7zb3KL4WWeDbSEauqVxaG/mD40dj8LNDtUCtyee+ieDxaEx1AiT3bMo
	prxt1dKsCjkjyd/ZBJ8Pzw3ZE4GnXX0rhCGDnL2IBjdsf7AcCwa5wEDXD6CgKtFI
	bxmM4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5kv4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 16:57:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6c166bafcso432135ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849847; x=1788454647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=;
        b=Szeiu3iO0v2kPGqjFm7z7lpKmOVkyeCmvfugVtG353WoLmqJ4as+cVPg1yxDDscQg4
         sXKlx3Bis3q7GWvILEXfcFMigbUQnCVhN+vdbR8NfDsmq6rE3h/OMjJ1iriPXWhCj/Yl
         gaNBGUhjT2Nqn2V8Vs72jgvGObmRutQ6WqnLFVWe36RzKOewvngEvI5qEvMPvgjGxyA8
         Txspb6MhJgX95Cb4lie9yxds55vMRmOpQ+Bji5H//s+b+tmuYFolBVj21SOaSoR8/HZY
         joA5YeEA+Mgky8ee5TTQSc5G2pPAXu0GCgtgeC/m3zungFsrnoDOGmoC5L+dcjT12K27
         wA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849847; x=1788454647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oiZ7uRGm/rRj4Rvi8JYAu2VtLeEDmJodOlaaWxlqkG0=;
        b=cvOit6tkdPIIgOz/GnnbDOVnHN2eXvabPjYxI0HGeei1PjQ7JTk27nOaKskLpo22vv
         Do0zCp4+hpQwbHdh9Y7KwujwvTN9OCz+VeayZzNjpnCMu4lCOeOPXE2Y3IEjiM5a47y8
         FBEKzsGfAQrbynVibSWqSMM78aEHpNOnoABCFEKuHBxWmrsXrOmv+h9jsxQ59e2j9Ll0
         xvBZjwA6slAd2QhHHxhQlw68ex/UtDMmQhuTq/ornsfLYZ29go3AgfjMGWDM8g1N9KeZ
         Fg0TTYxjtYum2CuZ7WLam3kX6D3Q5agVrjHJvrApcbgGKZHR7l1/6ZCtKTlEbHlaR3lt
         k+5A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/47HRAhIJlLD08++XS/PpzG/lxiJzBj8c2iHOX4y52YSWcum+kDdMqPigr5Au6PA640vUBObK/Oe0U4ea@vger.kernel.org
X-Gm-Message-State: AFuF++kBx5mRv3/atEOhbui9h5mlk77BFm7A5pOWbvWwqJvOke0NBAje
	A0NP49kRC7WYqxYhTmg4yvXNv9cbvWl8US8Qddu0//S/9xDm9Ts/00q36doZNthNvJ+bkgMWZOH
	O40a5DtCO2+BKmIMUPl6XJtCnQey04r2epiQiILytHjsWT6BVl8u2URqlJDnrybyCdAQE
X-Gm-Gg: AR+sD11ZV43fsX/o2SSOJd1cwqPH1V92Ny5ULvxFYTP76ZJ/7WtCWxFUEASIDWzo9yU
	iEOLh28fRxdG63JEtQNPNtk2nPQ6DqDMtAlOMPNaCf08Vk/wE5Jf6HL4JuAQGkBxaUrY2UfvCQC
	2myUPj2u2x91X0QmjmJC3RQAAknN3xu86JWOSLyRVlgjLRKFCul3MSChd78ux1uNEWikfYhTIRV
	kZuB8alxnHE54l32wVTBVuFcfbwwnmkR8++Nlq0SjgRwoHVfpuuxWF0aaEEv7KaUtWdMe7Znbei
	WWSYkfq+cTlacCxjGnNU09/iaANokoLS9jwoD/NEq8OOzsIFME1tQxzli2kNaag6YqbJ4VrfUBp
	+tj60TAhcEl6K24wB3t8oQKC/nFg3xpE=
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr3946455ad.13.1787849847096;
        Thu, 27 Aug 2026 09:57:27 -0700 (PDT)
X-Received: by 2002:a17:902:ec82:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d74df293c5mr3945595ad.13.1787849846596;
        Thu, 27 Aug 2026 09:57:26 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704986619sm20011025ad.24.2026.08.27.09.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:57:25 -0700 (PDT)
Message-ID: <15ba1e13-d4e8-4467-96a0-8a4250c8b74d@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:27:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
 <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260827-tiger-of-sublime-flowers-eb8f90@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RfYr-LGO-ezP5-OQxQKVtgho81WB0zmN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX4jR4jvq1rgBy
 G22w9Unzo1tfbdqSPA3PFXO8XLdcEChCJxdlt3RTWYwONDLgm3r9IYtmgOP6FRq12HTzkFw4sXv
 uO9sOjDoJ4rXk9T+Om3hAOCXLfHjmbs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MyBTYWx0ZWRfX1j5O1lFanBi0
 v3yYqTWB43DyXaHPL93fxUo7fJM0nyj0hjF0WRSnG1rckCMBomgT9LusfbiTaEpcC52vSkOZTfm
 Xo+JLArOdd414py23It/+oxdy0LQW/GEO1jZCl0qLFgps+1v9+yZBTKaBL6O+yiHl10P4Yz5dHh
 c4DSOgSNg2pmLKLmMT4E4cmJa4u7SqgZq4Ct+b0jlIJlyFuLLxb0KBn4EyKpIcD4sm6g/D6u7Mo
 q4tQEX/BeDaQw/r59Kl5XuRpAvbAO3JK5J+apo1X+4IJYOzrs732QGrWIdWym4SjuwprWhbnzPy
 wcam69Auf+CGrG62dm0QCRwvFWV1gK3Tfilqa+JBlu1CQGccrm6P4QPSneqB+MMzgFZMCCSEXZj
 Y96ExQ36hdICtvtpIfxun8dKYkzBeP5yQYu/3YtqI2+5APISis0d15Lcctsg/u05pW8C8fNuK6X
 GIM6iZ+BzqqacuCqc+Q==
X-Proofpoint-GUID: RfYr-LGO-ezP5-OQxQKVtgho81WB0zmN
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a906c77 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KvNN2iZ-vB3k0q2gmRwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270143


On 8/27/2026 5:52 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 21, 2026 at 09:39:03PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> Sashiko comment was not answered and looks reasonable, dropping from Patchwork.
>
> Best regards,
> Krzysztof

Apologies!! for missing the on-list reply. The Sashiko comment is reasonable
and is addressed in v4: the header now defines the GDSC IDs
(GCC_EMAC0_GDSC, GCC_PCIE_GDSC, GCC_USB20_GDSC) and the clock driver

registers the three GDSCs (gcc_emac0_gdsc, 
gcc_pcie_gdsc,gcc_usb20_gdsc), so #power-domain-cells has real backing 
providers.

v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

