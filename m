Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500568;
	b=aqQyogayIy9uFu0T+pH7KLEV0SMeLicENwWxCzn8h/HYu92rzRcRq349W5MGbq/VSOvM
	 tEKFEK3h8IXdA6TxVy5RClKDE6Z9oCmciIYgHRfK5lHpvng+lIajZfe96/KKAq2sG7lac
	 S6hZU3h+zF4Drc69JUshcIXqe4x08b9ug+i5Uw0Z2bSslmEKh040Iz15uGUFX220HZ18B
	 N35OCGIV9P9l7xRBiXVKrSUcu7JjbZxaLzplk5vhosAL9YgyN4v1hkaHgXY3dmzMCU0Ts
	 1NJt1/Fc1fuHY6/wPFxt5GF5XNBChZaYLUFGW7cu3NDD5KQ3f6FyKutUvLTWDsJ7I6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oZR/dethywgb+OWlTTYLjm29IyP6L5k94h7PLYw6w6w=;
	b=kyQrm4U0RFRv9mvctWPzbYfOK1czrfqT3H+11ed3vGY7PLNeYYJbAAQUYGHwZsiRQ5mB
	 PDiN7o/0viKmAUs3l/6fRlDJ0cMwni9ge+guQLH1RTQ52V+sNtJyRByltub6Iee5UEe3g
	 3ZYCVZm8QC0nFr5loBXmoU7/AcH6xF4GJC/v+EDw3PPw0rfIvAwZsF2YFZOGEVhq3tiNB
	 XvJpUh5l7VCa9Zhl+BILMtddzUIjrr47ES98dCyjn3r7eNqVIynRer+i8rf8gikRWI7Hc
	 NhXwr9ut//B/O8cgsVG3cCvcAIJ1lJltgq24yRldEtBED/HAicKfgKgmxyE5O1shdTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lRpMf7yf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI0nG2Cf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DFA606A319
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DFA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lRpMf7yf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LI0nG2Cf
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxHNl1292872
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZR/dethywgb+OWlTTYLjm29IyP6L5k94h7PLYw6w6w=; b=lRpMf7yfcNp/VUHq
	O083DxWJD2SSOyfl5nYh1RCJEm0sBLZD9cns1wrqEliBGvO1yjk3jbyDBp5ZNwrj
	ZVjGhJ2SsonlHQDLRdV887MrRw9RhyDBNT3E62ZSihfUyEDOVQ0gG4EsaepzGO0H
	PTfPaIc/cI7Smh5FnwgYXq7dfGK/XG3WyBK6YFFZj/rmIctTA5w50CsRZHTjjoPL
	UifiwWn84EIFk0e/OJaloarlmMOvLOgMLrsumnz0JcO8bUDlxSRJ//OYy4aJHV5v
	kzStxvjHMXTfN/ISFf7XwFbxVddgFeIHrgFtOP3GFWd0Sk+zOeTiy7GqvqBichQd
	I1y8bw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:49:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f33438950so834112385a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500561; x=1793105361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZR/dethywgb+OWlTTYLjm29IyP6L5k94h7PLYw6w6w=;
        b=LI0nG2CfRMB0TDMj7kdGreMXiV/FDHjQVwUVFd1YcacaCxrNTckVGXpjypsOxlyXcq
         aAalxYTdraJKngl1Ju4u0lBwG20IPCOkpF4dDELF+UIkKBBHhW41ys0XUjRn4nQNUuqi
         0PC3tMC8BrIK+yQEfyv3l85SdmJQiZoHlV6BhAkV3N1pSpOcf9mKNoNnPfb/GbE5T1IE
         nxbkWKDvwpx103q8C6GKdIkSnNXY4I0Q7IUMPyLgzPeitNefkWr4nQnpElidSuwRygfi
         cLJJ/fSuGqj0OIrmKn3YbqT0bRGzCBV7N1DBDNbLdlkar5GCYq4bBMwFx7MTOz+E/4x+
         xb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500561; x=1793105361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oZR/dethywgb+OWlTTYLjm29IyP6L5k94h7PLYw6w6w=;
        b=jijmBan7mwMWkz5lBB6r9Lead3DRGw3DyWekt3MM9bxNq8eLV+jUQNqip169rIFkdt
         pZp4dRwgfifLNu8CBfJ/0zf1nzOqUa61HmihkRRHjbXSK/5Nby3F4zT4z/V2Fst6cNyW
         //b524QkrNE4SHQilhp0F/DgeOY2ghJ9EOWJFLtXqY1KZZv/1DEp4/uKUd31ikZyMq/h
         AfpAn581JdQ/tG3oTncb+3KHU/Z8DiM8cMGlTyXH+wHiZUy+/msgTS7WhuPoZ63JCsI4
         /xXS5hTD6Vc8UohyaaQZIzAe+GT4pQ7FuThmG0Tpyhuv3wks2Soc8xi0RDiqDaIiuoIf
         kdEg==
X-Forwarded-Encrypted: i=1; AKwUvBwgnojHvV0HXfJpuADJLVn/JKdqWt1eEjYqGiMO0MznUeGqOK7qPcsAlg5EPFirgd2StBH+9AU3Jb3sFFbR@vger.kernel.org
X-Gm-Message-State: AFq9FYI54HCZkwbfbZJ+J/N2u1QyKf8I6hKU92YEdN9n/yLW/MNCC+pt
	G+HeUFRpHmGKJ1uY1FdKF468FQk+yWx4n1w3D9Tz0A1N9JLTMZufqy1QkeofAYoj4cd78IFeUXH
	CUPshdHL//5rJeAInzaSpzZN2odM8YEI2z1EHTKvQ3HDNlObECe2Kzch2bjderwJwahBi
X-Gm-Gg: AYBFou2kiK2rTW85puXhfnjPKtxjybl7iE9emEtwJHNgFxu4WfcSzolr6FusGWRcwAE
	kLgnDcn5bMzzJgq5Ca4RcauGV6uyhUDaLQFG8WkczD8sLBt/VYCV/uWf6+1DlB7SHb5+oxduu9r
	chbIUcmu9Bk2clT6+Tn5dfADigymvI2+a8L6yyzrRLWWhtuG6S/Lqm7RwNdFksxZbX8HxzwkFtg
	LLELCS3kyKJvB5mDiv9N0FsLLeb4mTohk3Jdz22vBFKMqT6De7P2jHua27J1/gebPhAJKxqck9Z
	ctNQ/FHMhQkaw9elNzBEhqdCmgq/pe0Bewf26RX2COyGdtg2CsoUS90lULRkUb3AK60si/Rc1NF
	XvhZeSqQnQ2I8Nv9gZRQrEIPcNoGe9nA=
X-Received: by 2002:a05:620a:3955:b0:93e:7898:4d73 with SMTP id af79cd13be357-93f29d79550mr1681664185a.45.1792500560796;
        Tue, 20 Oct 2026 05:49:20 -0700 (PDT)
X-Received: by 2002:a05:620a:3955:b0:93e:7898:4d73 with SMTP id af79cd13be357-93f29d79550mr1681660585a.45.1792500560283;
        Tue, 20 Oct 2026 05:49:20 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820822sm6490980f8f.34.2026.10.20.05.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:49:19 -0700 (PDT)
Message-ID: <a01d8d86-740e-4a25-96a4-d4dfd664af5e@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:49:17 +0300
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
 <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
 <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
 <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -WfIRBah_54hfEu-OdmgtsDGqcPBtA8t
X-Proofpoint-ORIG-GUID: -WfIRBah_54hfEu-OdmgtsDGqcPBtA8t
X-Authority-Analysis: v=2.4 cv=L7qI0OT8 c=1 sm=1 tr=0 ts=6ad76351 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=z6v0ilfeUS-LjjL2a7cA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX1WslM/ndqYHt
 zszu0ObXsoFa3AqrRH4Fb834XirZ3UgpRM72v89y105YWWDeSsyaqa862+9ikB9F8l1kyNc2Hsv
 HTS6zo6IaPCdR25vNrJbauMumZZBsgeQhBdmLSvIHXJwELaANCQXJjH3Q+qQOukshrAXXY9R3/i
 7c1BZ5hcQUbsho3EafLjvbezL5Th0SHUsc1STRCbxiSci8kbO/8r1oUBjyjyJdekSERQ6IwMls6
 rIG/WoT+tFtJJtVg0ac3w1GXC/31+L6aUFby4QSv9AG6m/my6YmVewe3v1bGRLzQMnyUrGC6krG
 E26rbItuOjSjkgjhDBHV3SSm1SKD6wwrcQ8gwYVR34QbCHYbSw8sItvFhvhGe1hKZGTQzRwkIro
 9aE4TRjuJnM6EKMFPilw7vMx+NTSf9uHecEmGNxoPirXCO0W+x4ktlFPZPEXdJojDw4txG9Q1zt
 RssTmshUWSn2ArhEYDA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX5MAFDdtfZBKa
 j2dYRcvL32uttv0miemWVEbsju6MnkS3337+bBSbgy3fDr+ko4YWUIV6nKl18lJ2KsnN3E5g4lv
 ll6QwN8qglxzDdBzlKGzBXkUvzlOQ4U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200050

On 10/20/2026 12:45 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 20, 2026 at 11:26:42AM +0300, Atanas Filipov wrote:
>> On 10/19/2026 5:50 PM, Dmitry Baryshkov wrote:
>>> On Fri, Oct 16, 2026 at 08:07:01PM +0300, Atanas Filipov wrote:
>>>> Add #interconnect-cells to the camera clock controller so camera
>>>> consumers can request camera NoC AXI bandwidth through the
>>>> interconnect framework.
>>>
>>> I guess currently we have only one consumer, camss. Could you please
>>> include patches converting it to the bus voting? Be sure to retain
>>> compatibility with older DTs, which don't have ICC provided by the camcc
>>> node.
>>>
>>
>> Before converting CAMSS I would like to agree on the approach, since it
>> cannot simply follow JPEG. In either case the camcc path would be
>> optional, so older DTs keep working as before.
> 
> How does the current camss vote on the clock?  JPEG is not (yet) merged,
> so we can't reference it here. The order in which the patches can land
> would be: icc-clk, camss using the (optional) interconnect, JPEG on top.

It does not vote. Each VFE calls clk_set_rate() directly from
vfe_set_clock_rates(), based on the pixel rate of its own lines only.

Where clk_set_rate() is used on camnoc_axi (SC7280, SC8280XP, SA8775P),
the clock is shared by all VFEs, but:

  - the last VFE to power up wins and may lower the rate under a VFE
    that is already streaming;
  - vfe_check_clock_rates() checks only the VFE's own needs and does not
    notice changes made by other VFEs;
  - vfe_put() never drops the rate.

On the remaining SoCs the camnoc clocks have no levels and are only
enabled. On SM8250 the levels sit on "camnoc_axi_src", which
vfe_match_clock_names() does not match, so they are never applied.

> 
> Please note Krzysztof's comments.

Yes. I will reply to Krzysztof directly in 1/3. The CAMSS behaviour
above is part of that answer: today every consumer sets the shared
camnoc rate directly and nothing aggregates the requests.

> 
>> OPP is per device, and CAMSS is a single device containing several VFEs,
>> each with its own core clock and its own load. If CAMSS used
>> dev_pm_opp_set_opp() on its device like JPEG does, every VFE would overwrite
>> the clock and bandwidth votes of the others, which is the same
>> last-writer-wins problem in a different place.
> 
> For this series just convert the existing approach as is. We have two
> distinct questions here:
>   - Letting camss and JPEG (and others) to vote independently on the
>     clock
>   - Letting camss correctly handle per-VFE votes
> 
> This series must address the first question only.
> 
>> I see two ways to keep the VFEs independent:
>>
>> 1. One OPP table in the CAMSS node, used only as a lookup. Each VFE
>>     finds the OPP for its own required rate, sets its own clock and
>>     votes the bandwidth from that OPP on its own ICC path. The driver
>>     requests a separate path per VFE from the same "interconnects"
>>     entry, so DT describes the hardware connection once and the
>>     interconnect core aggregates the VFE requests with the other
>>     consumers. The rail level is not applied by the OPP core in this
>>     case, so CAMSS keeps handling it as today.
>>
>> 2. An OPP table per VFE, attached to the per-VFE power domain device
>>     that CAMSS already creates, so each VFE calls dev_pm_opp_set_opp()
>>     on its own device. This applies the rail level as well, but the
>>     virtual device shares the CAMSS of_node, so it would pick up all
>>     CAMSS interconnect paths and need indexed OPP tables in DT, which I
>>     have not seen used for such devices.
>>
>> Which one would you prefer, or do you see a better way?
> 
> 3. Add minimal VFE nodes and let camss use those. Converge towards the
> split VFE (IFE) device tree.
> 

Agreed, I will take that up separately. To get it right the first
time, could you clarify what "minimal" covers:

  - child nodes of the camss node, or standalone nodes like the split
    CSIPHY?
  - which resources move into them: only the per-VFE clocks, power
    domain, OPP table and interconnect path, or reg and interrupts as
    well?

--
Best regards,
Atanas

