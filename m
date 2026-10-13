Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2645638E135
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886441; cv=none; b=qnalHVBU8RBsBjQs+oXtr8hqjbv86x4BebK67xk7Q4FDHhr2Fv50Pm1f2uN3SxwABNkvdsBubQ2extKVqG0PnrqmwMJJH3r3K3HL7SVkqGZ1r1HQRxx2fXL7yXu2d3kWq42F0fAKyZhxkxTL62ib8kBvFWu04pSmRClIrLtpZEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886441; c=relaxed/simple;
	bh=PbLnTdlpMC70FbudpPYD16et/o+1PhDF6d/QdufD0dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEqy3I8kMrdCilMEEyYdsoip2+7z9ejxcc4luWq/8oWMRzPK5mNF9QkAdy12+Vxwb2el7D2UhhR5rmjtYVF2bpN5h19l6Mm1s3a/83kkCidUzaqs0CxDMqRHI4zg1TnHdImxbirf5gO4DY3Or2BsUmCRVj7I/iDS6AJggsAJ8RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDAUieoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P8Mhgq+v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDAUieoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P8Mhgq+v"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWb1015185
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=; b=MDAUieoO9HXtf2ah
	tUFwuccCec+P1IeZsPNTsJ9IHe91jBOK9EhWG3DnQpCxTJXC4eUIYjzFoUL2eD4A
	uy+R/yNGFdWiVXVarIvhq4fbDfr9qGmEoCEVGIS0fMGoiWFTCzKfMzAec4cJHnHS
	n4Pp6wYhzILFvzDAYDiBBRS1nf0gP9227W27c8VwsZo1u46ya3m7jGWi7SCjwKv8
	SPRztyE49rXkGXgsMp19uqnN1ZPz+2w0fEDJLqn0mt77VPOYg04D588YRiegmuL0
	No2J9y9h94y455P7jCY8nNGzcoRrnslCetCT2X3SjIphAQjKJ+Mbdor6m3DIvcdt
	wdahCA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ugq25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:13:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe67so2225255a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886439; x=1792491239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=;
        b=P8Mhgq+v1azbXXNW6sEw6hiKb6YIXTXV+7yAOEx75fDu2ZdxMbQRfiPEoe1KQVyfRS
         4SPhh6UnUrK5uKToYVU2GjzSzcnToR/jgCIUt1xwmtxRX2wqSZ5pMUGW0MOrCmIzilCn
         qM4gx7JMr/60Iio7mZMmnEsOy5pWxXhTEn7WWYUh6GNaWJh8iMCG0BTaEEWPx4CdPNIm
         9VynR9apuZoZn91HyHPTBkVC6qxcRLMnvBFnRONCIdl7CxUVD90rhlhpowO1h6iZBzo0
         aefozD+LWYhBJsjbdI9ARuR13mYbXuQa1iWg9LiMAkexUtq4NIw+YAMZ7fkFnkt2Ibee
         kUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886439; x=1792491239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=;
        b=POCV/2/f1OKLLRG52+ktNr2MNAYWc651bn7irynW1IkQ7+AaUnvunYHRzGA85pIhP3
         BYzof9YBLGFYKc8QGU9m6VNdBAqHkg9wrr5zgId8cgr+X3KIG1yrReWQAkZanMdlCMNG
         fc4bvbyn5iI48AcaHvYAHxdIXpTgu237dhS+SFGIsiU4/20wXYNv1O8pMVmc27R/N3Y2
         BqVnZApavuDMVAuWAhpPd/U8Ts3an6V8PK+aWSddS/T+8S1vjZq/9qk2vt66WiQsJ3Ax
         WUlXSLEr3K95mk5sTdO9y9y+hMhodr8NDEQhngVk5HhO5az2X+oSjUp2ln3Y+5iG/eEe
         MMPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMMslWfPErNsUxbRCdBnoZFF2jPXlvHFGPPovSJxjSCbvq3hng7aOiyiZblVDMXNZCCIlDBLEkSUsk+Nw5@vger.kernel.org
X-Gm-Message-State: AFq9FYLMASqlQESFYOX+jMj1krj+olFL3kaZhhllo0O5H+H71tUaCNWt
	SLLaPxFRnFAtJhC/oXJHqcu7mWAnywI7XcqEgrRGWLGI+GZ105C/QU0+ZQDUd6g9fO7mlvOOuzi
	F2ALORrE2epKynbsziAYFnmO+x4xJ95Q5iOWspnj6D1jyBNs3IMy1KOc3+dulpwp9YTFw
X-Gm-Gg: AYBFou1VGXQP9Z3/Fd7kNvpfRjSeZBuHsZFTIkpZMiWfibc5h6bHCsTvUKpIRkvGJzU
	Pd5H5WOKb7txpwnlMwh/tULRc6b6u35Ct2jQX8M/WbtSgP23DpIp8mr+esLKM3pK79KnQgzNs62
	iOOk92MRGeg2dNkYR2WhRqeoFkNAytpTyBWtq013uc/O974H7W4Dc/G4D283aR24AfBAfSFEogQ
	qErbk5SaWIGodNViW7CUoqlYxC8mtuwbEfc5H3i5VWjLI59vxbmT1NnoZiye8pgPPXJoCobHHli
	qd838/W+j1LOdOZWr+0clDqnMOR9/rbKlA17305W21dJtUDZ3tKOk4PBGbweYmmyDIfb3Y318sb
	rFEuXTUYnBEGMHVJPu7vRsavhAxJ8k1OyhvB62h30HhlBQrF6igVceUOGTHkyx30=
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4583232a91.6.1791886438487;
        Tue, 13 Oct 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4583201a91.6.1791886437842;
        Tue, 13 Oct 2026 03:13:57 -0700 (PDT)
Received: from [10.133.33.200] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm21143079a91.17.2026.10.13.03.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:13:57 -0700 (PDT)
Message-ID: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:13:48 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX1zrEDuT7sEGy
 r/SUtadfR+jsWrtPCMY+m0Z71LjyJ+WGVnRkOY6n/J5fKNNRGjEEBMkiFfaAsQCkCzVoz/LMmsQ
 kP+vsKWW3lGX1vIdGAWuucrjYlHrsYB+RZbBiPTToM7bNNVd30nmEUxMqxBfmlzbXlJrZxLIS+W
 a1rEhd951FEG2v9iK/l+1ry4HVOTRsMoFpqhZ0B5yGQ2rSGfUGhaCI+DFb5KpnrZPUd2b97UONB
 YqRzoPporLngixBI2/Q4bPkdqOctB6W5Z7g3eRvWnjbyu6z8Rl8jmzPhql/cJCkEG3JzxyJp7gs
 Bx3PaYF5o8B4IZjkA/GB8SYhTtb0FwJMZcrxsmCrablY8ANBncqBD0sIenxY+1Kp2cLFfMcPkNf
 cVX0wh7iwWNF1DD6CJqF+X8tvbwb4c+k6F8eOR2zEyXiDXQ/9db11pTGNpKOJHM+nZ5TotnQYPy
 11jea1/q2j1GoXb3YAQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace0467 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=i3Ix9vWbyZrPCULteTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: SzGA-vQt5dZrFX-pt4YQ9o66SHwxIRg9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX88dSI0cGUGQv
 Rtj6fz6CpjTJro4vbUV0OT1Doo+6n8Gxq7DtdhSznAKAaDLRUXR0JxjOgJb8/5chGpWMPWAwJoj
 qseKBtkbngspzdcIemIB/GIItV1RvnI=
X-Proofpoint-GUID: SzGA-vQt5dZrFX-pt4YQ9o66SHwxIRg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040



On 10/12/2026 7:27 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 12/10/2026 11:48, Yin Li wrote:
>>
>>
>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>> parent device and its CPU affinity is derived from that cache.
>>>>
>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>> the root of the physical address space, so each cache node only needs an
>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>
>>>> The nodes are disabled by default. Production firmware does not expose
>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>> This DTS is therefore only an example for other platform DT authors and
>>>> is not intended to be merged.
>>>>
>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> 
> [...]
> 
>>
>>>> +
>>>> +        msc@19870000 {
>>>> +            compatible = "arm,mpam-msc";
>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>
>>> The MPAM register length is 0x321C.
>>>
>>
>> You are right, the MPAM register space is 0x321c per the specification.
>> Will update accordingly.
> 
> That is the full extent but truncation is allowed by the architecture.
> 
> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
> 
> Does your implementation have domains?
> 

Hi Ben,

Our implementation does not have domains. So 0x321c reflects the full 
feature page for MSC.

Thanks,
Yin


> Thanks,
> 
> Ben
> 
> 
>>
>> Thanks,
>> Yin
>>
>>> Rob
>>
> 

-- 
Thx and BRs,
Yin

