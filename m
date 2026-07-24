Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025B5432E86
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784892027; cv=none; b=QagOdc14QB2n9Fy1MNRC4MUbcAMi5E2h3zGUdNIZK7T741ZbjNtsiHrqKxZ6JBpoJHbRQsFOdNeez7oQAtL6zDFYMe0xOn/i+PDKn7AIfCY20LodZPwWKKXozjo/8UVzKpqrLB4hCrM9zbK0IJK0NoIlHfImshRNLR1xxqJt46Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784892027; c=relaxed/simple;
	bh=aVuVsXFjs7/0gp6/eDzJFJsFZKrvp65ashGjNex6uHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7vwW63EkalY3bEjdCYlEKbFMGKM1YpE/iATfapYRMgOI34ujDWnQ6P5Dva+3kByks21Z48FiGgjGrHPmFXz8ApHHHnJv+aYxcW96t7ViqaZlsIKJSkR7aDVBJOYvTWo06JSnufl3a5FTfeAK6SjPTqE1hPjx+X/dcfuW8/y0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqPly97u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1bYWc99; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqPly97u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1bYWc99"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADvFk3032211
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=; b=AqPly97uwQ+iJdSE
	CwqHiWWuAa++XKTPmlw30ESbj9wW70BAR25d1wUcpXzuf2eFHbsMNJE7c9ZBE4CW
	cE0NRqsJRHbrhF2/Mgk6kRvn8E6602CHzwy7dfrHqOgddt4ujxXYbLojpIeUrzi4
	JHhsg5njhvc5cwv21im5KhKec/Pkb/pr7BBib6R6z3Z+xf/CrdbRfhORclBEsZvo
	k4iKwhAJVjlYu4eeS6I77O+X7KmctzIRWr4OIpeG8MByyeqEf/983OJWx/WtfVxK
	nlWp8hREkBvpof6UbeXXc+NVBVUi4eEf1E2EMXVcWO4E0/4jGQDmHQKMaQb02qOH
	/micTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0be12-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:02:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so540427a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784890940; x=1785495740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=;
        b=b1bYWc99LH4zHQOg0mDDF8hDRgN3jzOtVeSOJronwfEzr3TfNKJL3GzU0jIeApmWj9
         lfej/P4ZRpKg+Ns+xHz3UdDutH/17iV3pTXrVmuFEJ3/t9tmifLc8f+qr7jzinKig64v
         3Itb30adqV/efiGY4yof5exT5yCmYvBNj5q+2g3pRdbBpHEKgyviwGZgK09seu8/FB2q
         2Aull+h96jKT/C19Bv/YwG93+3uws3yytQUil120a3GWKUpmVuD647k+U3O9wRSmsLQe
         kbG5cnquAV2lqX4YVhuRNijykwd0z/bbqUHsLUW/IPHiDVVQ0oz8bjIZketo01l2ZBlq
         xUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784890940; x=1785495740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3WranAQfzhXTtB1r8MBJk7fw0SYatMMlDEmM1ttxlk=;
        b=pHrLuJ47AHXHQo4xE3vOWLL/fi801c4y2yRuvvim58Zvi3AmNKBAl2ex8eOVRDBqeO
         2GMZQ10IpMnf/w6HatHCaC8cWYcqMyFX4N/sgjsAUU2g1TjxW6S7dy/QMiPrP89vq4oR
         yexXTxcAdulMHgaAq3vqy61jpV2d5K5V4M0VkANj2YrwqshqqEhCV7G7Y49q2G3atFjB
         ld4vbbAFdkfjD/gBG0eoQviVZmspSOYY5ettAcHxNwyAS+Y26/OBjq4vr7/E5CN1s3fw
         kYosSvBC6bVKo7G3D5tkR9wgb0ke4s0e93Lxz/K0+M9MJrFssA2qfzHag9GwrqDCo+gl
         UR3g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/cgCa4nLBiE/h0+M+By1cW4I+DmQuUZnzXSIZdYGNhWRH9lNLh7Rnf9ZTpyeuSD6SJ6c4I4j0FONaaqJx@vger.kernel.org
X-Gm-Message-State: AOJu0YxRAu0QThB3/jyr9ojv/Upe8E3GKelT10NuxAlbpLvysX+S5ht7
	T32z2+pbU657vtrm4YIoRIWfSZO/2MC39wKhZKLWsBH86ECDxpXQRPEuvyl/IDA/LtUrq3LaIZM
	dcVbQNqcbMk7l9K7YATdqx09urJWVsYLNpjx4ljbEH8GXhuzkYuEJzKU58nUmm55zB+zT
X-Gm-Gg: AR+sD11U2TqdAE+aP/zDBK3EQz4938IJxF7pE74LU5D+CeRFTP/h0wMlzYfLl42+9xq
	k19ATd8tdgdSuNOHkfVzXSzSpwjMm9CrEFrC3kdHEvepexZPkaaYBEpPGSOfpIfOK/CDvkZB8J9
	FRURPoAMWzeTyheH2nsub57fUA8qK4hCtlmCeoRJ5gL5iZ+nZm3CW82hKwnbtF55iXJN4DddHMe
	pXTb41ixBgg24QxExNtCJ3rsSO8ct1KeFolSxQu4I14mTFA+NvyFNWL4U6RAckn+qP07LdtWrUU
	pRNcwMxguUAFFaCOvaWSBJdLXopp/L6CDfNDhd3+ml800LcdkiZykJed7N9PmxJJlbErbJKfjZ0
	hdZGjXI9rAUS+i3HlLysBvRCAE8U=
X-Received: by 2002:a17:90b:3b49:b0:38e:8896:4024 with SMTP id 98e67ed59e1d1-38ec688dad1mr6724432a91.40.1784890940202;
        Fri, 24 Jul 2026 04:02:20 -0700 (PDT)
X-Received: by 2002:a17:90b:3b49:b0:38e:8896:4024 with SMTP id 98e67ed59e1d1-38ec688dad1mr6724391a91.40.1784890939701;
        Fri, 24 Jul 2026 04:02:19 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041bec23sm1264186a91.15.2026.07.24.04.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:02:19 -0700 (PDT)
Message-ID: <fd1f6228-02d4-4dcc-9dfe-f4d304598660@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 16:32:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
 <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
 <amM_ViJcG0jbDNmB@monoceros>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <amM_ViJcG0jbDNmB@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vv7eNVIdcvSMmx4NVaYD1uCuLoSKMWp3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwMCBTYWx0ZWRfX8sog/4HUiL4p
 LrwAt+nTOWKvil7zq4XQ9N1eI0u1TdwjfmjL+y5IJUTvM0AuzLHC8JsIRAMOVPbjXQiS3UpndnL
 xr1WDc01HiNarkdQrI6zSOeJtmdmuN05QUfPxeNFs07T0V/jqdsJoo5WTUNebNRV2iGOqkxxawM
 noS0PAkrYjbZp+QRdWG+iUFAzhVHFa7kaib4peSKjVK5cK/lempEi6DsUv1z0s1r8x46ah/yfEw
 VqYjUgG3qSg87RLntBFliFpzeXAiRBGXfSck4ct3HAEiYtoYG2iDIOtp5Yawso2+4lhTgkoBde1
 tcp/TLNfaIV3483crvZeujIVKAYgmwxC37swXu/K8U/BLUaEuJtWIsFYgQNfw1HOd+YnGWpJrmL
 +gl4ri42wpjK/PPTFPY68pL4/M4NOA==
X-Proofpoint-GUID: vv7eNVIdcvSMmx4NVaYD1uCuLoSKMWp3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwMCBTYWx0ZWRfX+dcbpG1F9i1e
 tRHTkYvg97Cbx5GUgv007GqGkTlBDGcwoHlAtdRU+Y+sbm01lt6JNJEro8+7Vxtt4e9sP/xAdre
 0lFJMmZTDX7KfkOD6wmoceML/eO5S2o=
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a63463c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=XH_em5C6Qgemdf-nh0kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240100



On 24-07-2026 04:04 pm, Uwe Kleine-König wrote:
> On Thu, Jul 23, 2026 at 09:15:52PM +0530, Imran Shaik wrote:
>> +#include <linux/clk-provider.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> is supposed to go away. So please drop the
> include for the latter.
> 

Sure, will drop <linux/mod_devicetable.h> in next series.

Thanks,
Imran
