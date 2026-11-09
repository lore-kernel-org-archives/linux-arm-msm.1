Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231036;
	b=lLWwkyDTGnG9szNG1vwgcOoMGABhU7DgmLP/PX3KanRy6HREUMAcZSJHOo3g6yLxrK/M
	 qJGGJMnP+5eePlLjtS9gdlCfppDZhoVtzA5KvkW3Yf6T5dDrG/nrNZ6S3Mprxbxtypioj
	 1ae43ytIToXmh+2d0/4wfvugsBT3fxEJAc+jIwczFkQoEmzstmsPUJ3HH/KpU00KvIXM8
	 ErwDvgmmRiJxhHrJ4VRgvxK1/p7rO2uTz1OcqMcXRmIVqxdod0yt6xxm+yvs3JuzMe/qe
	 8peuFDeExRxAM2pOeBo1NiChoZUHMcptR8yo+JKmORYPrOTPjn/ecMx79JB+rfujfTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
	b=H8O0nM/YtG6/jbxcDWowjrUw60ZsqNSt8ulTl55Xzzw4dP+3Fajhzs6TI2SSc3u59xSC
	 Y+i33pz544z/Dn9Ho1Ik9NWcE06XmD8OLOiToWpD4A1LWV0GFSgE4o5iUW2DvV2b1Jyow
	 mc6p8w/k5OwQ+blgkTMeIxQLyEdmkSg2SGf127cC7JWjnceE1NzmMzyypKjr2hD3DzvkK
	 aR4Wuir/zzM59fl4mA9D7OxWRmH6F2LXCqPq5QZqaJpJl9tOzASiKKv5g9k+G1+aPwAEc
	 6qip6sJ3VH/VxUS6EuZ2mqyQY4DqzmqpzvRn6YyYyRZ+R7p1GoOv6et12rtKHKH2QdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HbinuI6i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoY695KL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CE9606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 13:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CE9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HbinuI6i;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NoY695KL
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFNYf4026042
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 13:30:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=; b=HbinuI6iFwunE/J2
	ndoJp0ER76Ir2F3muz27Qg7Hip0+kV8NXThoG+/nKdcIcW1t6F+Msm3rHsIpQsZo
	om+eiEB7uW1kUdA4n98FK/I9MqtIh3er0T/5ANmFhhrjbv5HsW2qFI5db8T6fTB7
	YYy4JGBXcmP3mu604L8yKJ7EB+tezNWVqxlAt35Rmo2RjSkfAykzCf7X5TBom8AR
	CzrTZ2H6W6i0/wr9eTy5nJ0EvidNXbp/YBKnkfmx6a4KfRufAfLHi8OdqDf1RboW
	6NsBAb2VChWi6J0A/7gb5d5nvxoR+tfc2uWMVIa55LO7ILcf0GZAL2ufZ9EiNXkw
	7BFKGA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58953v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 13:30:11 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso21599137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 05:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794231010; x=1794835810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
        b=NoY695KLpf0/jKbuflSLGuUrmX7DxBwa5NQG0BgduFVVv+xlLz4G7swACOWhdauLmK
         lICreJJGh8JOJbkb2ReTQ9cjzCI1pb7eho+BlrcNn2OxKppP+WsQrxhleCtag78kE9xv
         G+243yRuiF9ejGu/0XWTzmP5ig1bcc6WQGhmNBR2ceiEGkSmis5vN+QLMn7Ro3nzAxlG
         dqNLiuBDPTYFZxc88+rXLG3CmQFJfDbr9L7Uy6vzfvJ4cZ77wqyehN+KiRV1/76gD2IJ
         XIcG71UyEwU9xSKlVMlZoepA0EHR6wyDQXjM+ccq8P38E/MLfjEHlrH6yxHpQStT3zl1
         TP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231010; x=1794835810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xWoTCJX7g0Ymvrlgv8LUIarTuXZICxScd6KoWd+6ds=;
        b=HWqiM9IeLcrdPCm0ZcCZ7LCIVmO8yck2cipmHdAOMvssIIuS9YZghW0jXQqkB6SdM8
         /1h6ckRM9m2/oEB6HQ+1K7Ww3yXiMTTrVfCgYKtF4rIK/dEjVzsbCMf1JOfYPPUIAFMP
         ECiJ25cBFSU4pcoNtluM9pIqrDDbjGbMMbCNnwtJmgphXb2RM3t33BcFju6S7hTHKnOA
         4D9dNHnqoqiKXKjzy3+Sa0xYLY7xJ4FaxjAMBn5zUkGoeVtXEJoBA4Gec02o335zCfdM
         vhsr2E0mEJ33wosd0TxOeU8IIV1WBYqfSWUvQBaBugPGsBtRxrKrZs/ABh1H9WPfPHmO
         zkmQ==
X-Forwarded-Encrypted: i=1; AL+hErGgKMe1B9+N9FedcEfR7bUMEgOt6hqk03t27DQJuIGcdydBj/9dIoJRMx4fJfR/0h3qfDtctg5OEDBLasLo@vger.kernel.org
X-Gm-Message-State: APuU4Z+1cHEAZqnQE6QsN3SvzqmB99DZp/Wws9wl+Ra9nJArs8rcHt6D
	yEzZ5huyOnHQj2RRBiY5V3WWDZpVVXRapw7inRlTUyGv0VlyO/A5GIpWylo4o1E/J6bYcQbg9Yt
	eQvTrTbXvjxYl7TGPqV+G8SlYAPy/ckE9WAbAAVfpfSDPRe+alKPid5nYj++YWiZW4XKtYeMDAl
	3l
X-Gm-Gg: AYBFou2xobcKRdsWWzA9GKv047wBQqNw5WSGjZrqckxiNCrMrl/x49YWlQOuE668Qia
	KtEkz9y16i3Ap1ZuDYPauo67u3DLmB6DmtqYp8O3zeOEJ2m/Ild/VLfznyjMQB/QrpMl588Cx0x
	TBENcVoYD0IawnyKwH+n9kpOiSeRFmhkZl3JerX+ekfZAlr5cu0VnlAMpTD513d2dwAH4uv7iQD
	ezjxT/nl2HDFXJDctEUbnD+2oHybpZcLTmP1cftWqsK5dl66Vi02fEr2nlTYvXndo2bTT7x/XEe
	39mIhQGmrh8I1k0XIW/GOMlGV20g5g+f/G6Ra6QZUfjjPaktBLyGOh5eP4W6YG0jtF0zBy8KXU4
	Yuvpt5zdx8XYGlTQ1juzoo4ogzUtGgsFrq7pDWKY/f2qHpV4++gPtwLw=
X-Received: by 2002:a05:6122:84c:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ece73a16a0mr924053e0c.4.1794231010014;
        Mon, 09 Nov 2026 05:30:10 -0800 (PST)
X-Received: by 2002:a05:6122:84c:b0:5ec:b681:f4ca with SMTP id 71dfb90a1353d-5ece73a16a0mr923985e0c.4.1794231005511;
        Mon, 09 Nov 2026 05:30:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a999358sm170236466b.78.2026.11.09.05.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:30:04 -0800 (PST)
Message-ID: <f942043d-a46e-4792-b8cc-a00280eef29b@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:30:02 +0100
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
Subject: Re: [PATCH 2/2] interconnect: qcom: Add Halliday interconnect
 provider driver
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
 <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-icc-v1-2-def7cf786f75@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfXz6rpcc2/lzko
 sYIEXDWTBXajAimIrA4J8LwFQYxuKO4qXSzL3yR2gidYxvwn8cXLPAGC65sFsp4zeV/hPj9bhCM
 MOuooKJGrnyiLeHbAKuJQUNd1sdvq9xzmespLHhoFvFigDUQU32KF9qpMELf08YN1IAJwctkyWC
 fOC7juUHAigX+mkDxgwYtNPHScKF3qIz+fmuVbpt2OooYKgsy1Hgq1BvqQQ3eEnQx74x0jBgEX7
 XnZslCQ+GaxB/NSBxSnoafOFXxFAdbhMT8titJQbc620YptrkxhEHxxoQOQtr/814Ws6mkbN72t
 A9Y05y6SxTLHl+tmmdsLzVA1FVykZmGSN/dP1cqbZyGpIF9xhbPj+W9fRpNOfpvKCjyWR24uOcr
 oyLpQgNYmSa01weAHhPoXXDXl6RDkXwn4HdU1D4lOyTFp+YqamK8Dk1bFFvsHKLfOmoD6fmdxOp
 Cvlcwa8MyC7JJPval5w==
X-Proofpoint-ORIG-GUID: uaHQHQRGDyWIRvVg3hQHxjt_VMD2gJBy
X-Proofpoint-GUID: uaHQHQRGDyWIRvVg3hQHxjt_VMD2gJBy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MyBTYWx0ZWRfX4ZgghojdNv9h
 oBqL46ST3v3KEHt38g0MAFOgXJjCcFPRgtAYeW2qUrNoVxWZXY/gq3h2THBdXevHFxjuaTsoYgm
 pnaBK6hWD2smyzkw3LLVC+vUdrPgflk=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1cae3 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=s7ymY0F4v_VPunFmiH8A:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090053

On 11/9/26 1:29 AM, Stanislav Aleksandrov wrote:
> Add the driver for the interconnect buses found in Qualcomm Halliday
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated bandwidth
> for each master-slave pair.

[...]

> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/interconnect-provider.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <dt-bindings/interconnect/qcom,halliday-rpmh.h>
> +
> +#include "bcm-voter.h"
> +#include "icc-rpmh.h"
> +
> +static struct qcom_icc_node qhm_qup1;
> +static struct qcom_icc_node qnm_a1noc_cfg;
> +static struct qcom_icc_node xm_ufs_mem;
> +static struct qcom_icc_node xm_usb3_0;

Please take a look at the newest files in there, you can remove these
forward-definitions. Otherwise, I think this looks good

Konrad
