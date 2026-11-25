Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606508;
	b=itvCzYUfMhwTuqIm7Zx0i8LE/vqjB2NQyotxU9iMtdjKjb9TnKLWatiwV5XAudxS6Yzo
	 6SM05VoANBw4CJXT28BU7KEhWMdwAtPkT6nhyaU2NWycucHU2ajrmD808rbcUMP4IlXhP
	 IWC6Lp6mIAxoc/v0bLWZOBslnfKJ1zV0XycLWuQerRfUnQ23rGlJA8vQUpydjyvNMFM3q
	 05wdLL2WWm/Du/s4/h1R/JE3pGWFSTWzOtCcVyOC5t2/QShel6mQhGol55a8jMwhegRuk
	 xQPKes+ZZdnv9zrfo2MKgeTa+SIq5jPrD+mb2wrYjtufUO2QCKizCcLTARXASnzwuWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
	b=rrV5l90OtBz8RaIZrePoCsZ89/powGZEl1pHP1kC8pDvmX/zHSBYYmyO+oNQ3coNPbwz
	 qD/d2SJOZvQwYxwWCneXInJiftWQf8lzuk96mrgBbQRYtgUSLD2XyjP32cYj8CgoBdNTP
	 S9H/ocuSN4Cm4ckoohPGAfAaQGqx4G9lh5uULs7r1zcsGuBenUUoJEmFszDST0IOQkrUs
	 YyF/H3+A+EAXdFO+oF6ljZmI+joNeUHglkLKBCmpOCmyMZTUy0wReAboyfYgnEsbbAdDE
	 3bnUw7+5t/bRB+0Mt3Dkqm36r4/W8zmvKl0od9LHbNyIcUA3qJLcitXgNu4Y8L/B+sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D33606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36D33606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTXr4034142
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=; b=MYzmxXgKtuRtdvoM
	2/jIcmBxMyMhwy6zWv5SbPxLcF4LOzA7R7UcO91F01sgan1ZspmnsmkGA+cOm2Dy
	HQx70G7HiSMMYB+43HbQqY8a8U/POeTe31+pJFGHQ+uMQBzvvqy9OvDk2MOq0rka
	65OhKXLYAES9TesJTJm8ZfW37louGstDu1WoOZIgDDRmRawcpZi71Z38KBqx0/bV
	C5SAKD4MrZOT12H+5NKrOfD5epxhWZWJI/VXplb3G/Fl1WUl7jbKW6L2mjnPmBZ2
	n2gnNMebn2gHiHx4DxljHsWZlQZSNJ7aGudIie9I6CFahZIJFnnqPdmLefNMs95p
	awZA6A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjj76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so6043977a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606506; x=1796211306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=Qu6monxUigO1xiKQfsBrY9HiaaLURfxH4xzis3QCVarNtpaNv1KtcdiIMyx3f4SMLe
         OPuoBEQEQmuDPdNLny2rHBYiy9WF3/JyK2hkQO/Z2R8qaZN3+N3Nzq3WBX2g+Aw2zzmQ
         b6Hp+0uffZWhvCfJTjWBY/a5xd4vUVE1FkRM83Ibjez5lWlh2822wD0N6CQk7B6RmfPo
         DfT6Lxx+D3NS4j2w9kaN/l4KcNH/v+5L6j2f3ag85BIt5YOb89y96PmT+r8R2PsWNO1+
         5RzCSLNP0qRIwmrzpIuTY+ORPpXOxXU4Cug4/qaQ5cbWgDt4F9VP3qKdFjN1yx4ejbhy
         fTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606506; x=1796211306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=qQM1bp09sHMrdRAuX0zuD75ltjsRrwOEcTZElVB6ICZhHFBPwdpQ/+IRUUckablcH+
         VSs+VBecTJe/HUEx58t4oGLKc4fg+NyeBeF8defPYFidEpC/Jg5hQUgtvgtjypaNoY+J
         PhcFeOrBxiwCrRhAU9iTeDq2rCOtIpyjIZlTg+rmg41lIKI9rV+mnWsimfmOOM7qYi2X
         tRuQ8ynIfMBPu7fWisszbuzKEgz4wK5rofpDey15E5KBdx2ricIJL3WGs7jqVMcYSmB2
         wbOzIjCiffXBzcwz0LYGWC4Tyn+lxNj1yZv//xKo+gl9F0mwI60BzjkJZusH/rP0xlCg
         Rytg==
X-Forwarded-Encrypted: i=1; AL+hErGaIyqdDCuAJVu2wOMZEEssqY8xc6RNTItMC8K7kMRkuH4bayY4U03V2H5/3b97IjrCXBvdmrLBBvFGdPB0@vger.kernel.org
X-Gm-Message-State: APuU4Z8jKhfV5EX3v4k1dPu1jljoPc4so8e6OYpwf/eYszjdE6iEVAzg
	X7GcqZEwAx++eH3VDsPb10g1FvcR2gM3lQP/UD5hZMF9qWHocPFP80M0Cv86ilfd9RLJIfLsEdL
	YhclSbfn5glytx5AxTXP+sEW4RjC7RNRcIuWD4beYzXYW0CrRZSONSTPxkUiXqLs/u2WN7RI1St
	YVPIs=
X-Gm-Gg: AZFdTZdop0twRFm4ZAogagjwfHeiXEJGd4uNJTBYMP6Sn6G7Y/cq5MWnvbQrNYDrSvv
	ZRWXCaeYoFGExLNEex1x0MMR9gDPjJgLNs0YTC7Dg8pBIcvBoynAks0kcjdjN0jmUsG0j2YHp5k
	DCJ3KL3SgEw1IRERFj5qH/EjLgYTxVD7xqCgI/GcZCW4l1VWj5eAKckxvUDeomxcvtBKRqBTPf8
	I8Dviy7M7p+qqdx/8DEIN5jTtpQmc1hYdFyTPHxcO4Al8pjM38b4JgQxF4LqaXL9AaoctZO7GRT
	ooOXi7X8fKhKXbf/7WiSRgCltaIhjoJIzeKEiYld3KzoGqV+j280hgW4qVJt50QTb+vl+VjYJk3
	Tj/G27WZASFUPGh/TCif4CbcoTZN39XzfG6qsaa0dMHjtEXSFWbqoNQKsjWgGvx8l6NTXa1zEBw
	NG1pHVh2vsulmXYM7VFbx8bCJA47O2SSrqCT+uvKsYizMnauh0KQIxo/uAWUzBduNFBA==
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883179a91.22.1795606506448;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883157a91.22.1795606506045;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm6347749a91.17.2026.11.25.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:35:05 -0800 (PST)
Message-ID: <396403af-1505-44b7-bf21-8c656c64c936@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:05:00 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX0xut5JAAix70
 pb0ii/0a/E36KHlTKrthgRMg7xHhN7JfP5bAbgU1fv+StckiMT6o3qCzMhpVohqCHiF83NhLrIt
 P1k6bM1AbBJ1xn0vqGyCf37hNRyXVI4=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c7eb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=o-GtmX4WOUCOVLFp2qcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX5Ibrbqe7xwi0
 2mvysrFxx/BdZY2dE5zc1+7AJQTiw/R10qm0vxB7kS5GArujEI4g0l6H+PpN+joWYwQBdCz+7lm
 8uHXHqQqqZZMa91PqUPIMiBUUPhz/Jppx4OZ7pGC7A154nJHK2aEZDd24eV0Lezyj7L9UECyvvI
 HfX7GHFAQZvKwbYKqUccwBmcO8tniFTIbLcB72XE+Lh1466/Qt/Cc90UpUfCA8F4ISa+FY/zGB7
 5TpE82/Vdzybwoxn0Grr3Jb5m9TthH+lyUQODHf2spEIvBqcdQsMoPo1gbIky5U+httdCmc/Fy1
 Mce98/bKc41n3gBSN2Va47KDghFWy1v+R92VlEItZPvhGnmlx/HoFZ/L1wcMIVzUyOg9SHfe8B6
 AxVyBZhSn6HKyHINH5VKM99/rlT4sNeUIZcw+fuEO0MjLe5aDr11vKBeefPnOUyWEZWXoJKf7OD
 It8dNDduLMoCJkXz19w==
X-Proofpoint-ORIG-GUID: bXQGfw-J-bK_Bn5bss1BeKP_OBNr5IiJ
X-Proofpoint-GUID: bXQGfw-J-bK_Bn5bss1BeKP_OBNr5IiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/10/2026 6:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>> be owned by remote island io independently of the selected mux function
>> even if function is non-egpio.
>>
>> Presently egpio is treated as a mux function level decision where as
>> hardware programming guide(hpg) specifies it as pin conf level decision
>> i.e setting egpio bit is independent of selected mux function, the
>> driver/apps claims the ownership of the pin if it's egpio capable in
>> case of mux function being specified as anything other than egpio.
> 
> I don't understand this. If the pin is not owned by Linux, then simply
> do not list it. What is the point of listing a pin configuration which
> should be skipped?
> 
> Best regards,
> Krzysztof
> 

The pin is not owned by linux but is still being used and driven by
linux for it's intended function specified via function= property, which
would mean the required mux config for the function selection has to be
executed in Linux
This property simply allows a second driver/peripheral to use the same
gpio since it's allowed by hardware
