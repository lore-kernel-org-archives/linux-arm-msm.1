Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794898084;
	b=BQG900oOUVZ0Wu9eZYL6MXLKNZ3xqpBTd33o3nNba87NO06AIlwm9TP3dia5PEK3AeFm
	 WNer8zuTeMOzWvVyUwH8h1l2uPf3zI+5hQ30qmsyPOcNAFoo5NXtMS2QZHkDsdkwmub2r
	 4+gJtjrhhSWQLKljAYbUzKr6s++GvgpXbWqYuG9lEA7RNpte6ztmj1hWqGbkfj6JFYpxt
	 1iD0mZmAO2GzI5wSqPZqwEIcgNRIoCZfvfkp372fOWMFnpeWq1svDD1lTCEz/zTxUvHnA
	 yS+T8cj8IEW4st8gnMGvQOieLlk0zbB6VjM4Goh/Mfg1fwDfFejFbsQvV6uNTLxKb0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794898084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HsuQV8u3e7WFMB5SmWlfvmRte2dGPsZZ/I5dS+pGQLE=;
	b=M9pFtqPBCKaYwAAG5iuBclN3UeVLkPAPWFEVU7My4GpBkBGbpp+imHiBE9coeUx+O7/y
	 2AY3M16uXqKCGTgZ5Hvt+3GJ2labGNLaK7xeyNv9G9CuZEqjqzL+0GZuCzXKl+sLp6KWh
	 xM6bTtiTVBaKo+VGYFsFI03LDwwDA77CpB4i3PhbMjpTQA6p2CsYznB2mhMbL1PsaQn45
	 t15D2XdduChdMQry0O8QThTYNvK8CF0gto3SD2ICM+RboTwelWrudS6iVKNrkamadGTH8
	 c4IdzTfSNg3MBL/nKc7+V84fWSvyywsrO/AXXa53L923bLvWogUeQR4gIhx6lfIy15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="f4CDS/mQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHSutkEj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA3D606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA3D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4CDS/mQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHSutkEj
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aADu3624121
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsuQV8u3e7WFMB5SmWlfvmRte2dGPsZZ/I5dS+pGQLE=; b=f4CDS/mQCAQF/Q3i
	uECsG2khaXrlUO4NKrOfZTK1RidCSVeLNp/JsdPIamvhRJXW+QMseSLG7H6p8cff
	DZg+ss1xgOm+tJwkOiOO5EM6KbxtnANqor/UpQDlUPI5eodNEwhoaT2dloYfEOBI
	9K1+jVgbc2NVdhfIcEzfX4QiFSbusm+K5DQZMHJmCjxbNrdsfHSryt7vSnJX2eez
	37KRdfL8NDuGxok0twLt74c0WTCLGMw5PYHX5Ca3o8HK/8h/sb3SNpjF4j4zOpLh
	CRFKT+MC0gRVEM1FXWt1c0vi2L0ql1uOSl+0QrAVD8jMuTgiqYUlFHNoJq3Wu1/h
	bhXDJA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rej7hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:48:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so3352275a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794898083; x=1795502883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsuQV8u3e7WFMB5SmWlfvmRte2dGPsZZ/I5dS+pGQLE=;
        b=QHSutkEjJhEtk/vGQeb2EMphpn6RitDr5xZzqFjYaPWcsFhzJqSPwS1E/OGzZMgdOl
         nHM8JatDJqkEhUkL2S88/4kwrlcM8ivyWSegLKRXRBFllni4GlNd8EJxE19aDT2bTEwa
         03+8X/8ec5VdBVmCv9WPrVTeYPX7MPOiG18yU2gO+nYa0+72zm3FCYxegwDaPkYIAFfy
         Z+hq4tWbobw+ccBIaS8nbQjrqbt5dolVQTVPluscaiwrv9h2dLXLdrefnnQdtQRUre98
         xHYSHPoMJ1M9UcdidxdsXirIPQW7+6WMGHevsYo+5KQ0P8bsnUhGT0+1ceBNq46DeM9d
         7i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794898083; x=1795502883;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsuQV8u3e7WFMB5SmWlfvmRte2dGPsZZ/I5dS+pGQLE=;
        b=SbSvpqe/xaEkYh0M0KGe+pye8yYS4hBmxyTJCmvyOIP/6ymvJlvPQUSyfb6z4PJ9+T
         HQuCgj+udSHWtGs3JbMdBo6ou+EZKBqpVDUQbuCTqeGceOVwoo4wUeQQBp4yqzNqJvNs
         kgusapf+sINvD74fSkkPfWH8GxxId6sI5Y4wL4LkJlx/eLRQyruBstS5qvw/rtE2kzJI
         k5s3qAayNBnxoM84iiNNdWN3OR1wxMFZHu3OOk/uBF+kF/t/LSmTBMAInXcN9FaPjzEu
         YubwcYs0mRyCDMOWKa477PZfIK1UEmnpFDOvyHwqc2G7LKFF6zr9LkDl4DdUyuBigJPa
         j6Rg==
X-Forwarded-Encrypted: i=1; AL+hErEkjQ/Rp/vkC7a4Bx2uABw3nzi20nFxveon8cn0vnqqJ/F5XExopgtXUBt2sq2OOFmYckzpsrfj9j+Hs3Mn@vger.kernel.org
X-Gm-Message-State: APuU4Z/a7FlSU+VOOAClsgDq07vFSdpZQexzTYlbwU416pRzyaQq51IU
	DEuMKR0Zzx8cTs05YRwQkXwmyuZI2vHYfNJ0EnMiNqJLGk5BWRZ3FgU+Bd4fRvvfU7FbwCigmbl
	sI8tsng7QknlcJihiSKSPQianTB7IhjC+rBOkRGrK6GlSOP6WimswwBpml2wokU8Rd2bF
X-Gm-Gg: AZFdTZd3j/1EIHxTxUv90NSLEkBh5PEABVeXX1iAjYGkAjCk1uD6fjr01IyhfpPkrIr
	659I+6TH0DO5sdSvm1f2gDZEl/kxZgcxJjpGx+4Ub/5gnEcWJtOqT469vSLKbW36h3d78pSYrT6
	DgCkc04QcEYwZsoipOnMNAt3ZSphRKDvZvFvIxYLXTgQ2AjY9OUU4Tv8KNrYKNFh1ZBCXP1jmvn
	GZZigUYodxaeQfbu2sQ7dihPDGTR0bFeGzaX7Sij9d0uve4E/UjRNheY9Prp6SAgYfNFQ9CBkIR
	B63aQlOjCC1G9Dl6V73JbQMPPV2iyj8kfuoZ/bTpaDoWbVj9WtB1eN/X3RGl2i8HKi9p1t06nV+
	iHqZRQZq2oiSeoSdboQSTkvbqaDZj3uzizlCOpCHkdu+BvqXvf2N5r4gxLcNd6CzrTI9gBTh9vu
	fPcESzTFGTllHElKXdZlflKeBwGH/0r4pRt3ww59RYw+YEow18Q42QJO1+hI+T
X-Received: by 2002:a17:90b:28cd:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3b1b087c1c9mr11650340a91.8.1794898082837;
        Mon, 16 Nov 2026 22:48:02 -0800 (PST)
X-Received: by 2002:a17:90b:28cd:b0:3a5:147a:3b63 with SMTP id 98e67ed59e1d1-3b1b087c1c9mr11650312a91.8.1794898082257;
        Mon, 16 Nov 2026 22:48:02 -0800 (PST)
Received: from [10.79.117.97] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b25ebf34sm8650420a91.1.2026.11.16.22.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 22:48:01 -0800 (PST)
Message-ID: <de12e109-54f2-465d-9586-89734051f373@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:17:56 +0530
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
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: qcom: Add Glymur OOBMSS
 PAS
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
 <20261015-oob-support-glymur-v2-1-715435f52dd7@oss.qualcomm.com>
 <20261116180223.qk2k4zabk6tp6ihx@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <20261116180223.qk2k4zabk6tp6ihx@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNiBTYWx0ZWRfX+9Au36zvyjuc
 4I+67+E7GmOuQ9q53lSH8d68qP8bk1xvl23A4uRZLoa77hmJ3EsjhqypGwqOpXQYtWOajc4HEvR
 0fACsGH6w4IoKR/45U9DfGA4DllnxV8=
X-Proofpoint-ORIG-GUID: YFIJJF_rUZuXSDSb3buX5yVVOrcS4ShY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNiBTYWx0ZWRfXwTdMpD+8S92/
 xIaDVAVRZN39ZxwQRRMUzW+DnhDadpqX1t8AgbIco4/YvgVUGVCKS77xRsjw7arXyAv5ndvt7AK
 wzWAKC4/Q4IDzSzTtFgZf3TvxIWcVClLpZn8eGcMC7wjuzYbF0pFKtwJfImVOFMnn9AZdFWLjd9
 ZlexA2+8FfNgC2o5FUixniTGK0og2PCExa6BxerCf5YQ2RECjqiSkNw7WvV1D3uBFH1NZHC+Ql4
 0I+1mGelMRoUDLhvij19MVsWA7lKl4LUsd43K/DurVH1Mg7MihueiI5bnuTGyILNTUkd/iYUUjB
 WUFmR0e9vs0eUetwHuYmjaeeu6RPa2hlWnfyO7KDRYNez9T04y7fHH9d/oU0zN1lUHwkd3T77iR
 sYjPlgjsQV90xVrZEMYa3k/PjyJUXDE+NMkptzaT0gPibH8zx3WPw4sSqNvj5pN/PbHFXrODKr8
 9CccZKKkyKs8D5oVXKQ==
X-Proofpoint-GUID: YFIJJF_rUZuXSDSb3buX5yVVOrcS4ShY
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afbf8a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=7OpPFmXP-hqOOPK_F8cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170026



On 11/16/2026 11:32 PM, Mukesh Ojha wrote:
> On Thu, Oct 15, 2026 at 11:25:49AM +0530, Anvesh Jain P wrote:
>> Document the Glymur OOBMSS PAS node with its secure GLink edge,
>> shared-memory signaling, firmware carveouts, and power resources.
>>
>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> ---
>>  .../remoteproc/qcom,glymur-oobmss-pas.yaml         | 154 +++++++++++++++++++++
>>  1 file changed, 154 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
>> new file mode 100644
>> index 000000000000..3aa96d2262f1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,glymur-oobmss-pas.yaml
>> @@ -0,0 +1,154 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/qcom,glymur-oobmss-pas.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) PAS
>> +
>> +maintainers:
>> +  - Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm Glymur Out-of-Band Management Subsystem (OOBMSS) contains two
>> +  processors running Zephyr, managed together as one remoteproc instance.
>> +  The Out-of-Band Trusted Execution Environment (OOB-TEE) is the primary
>> +  processor. The OOB-Non-Secure processor is an auxiliary processor that
>> +  depends on the primary processor and cannot function independently.
>> +
>> +  The primary processor runs the primary image, while the auxiliary
>> +  processor runs the secondary image. Each processor has its own DTB.
>> +  The two images and their DTBs have separate PAS identifiers for
>> +  authentication and dedicated reserved-memory carveouts.
>> +
>> +  OOBMSS is booted by earlier-stage firmware and uses an XO clock and the
>> +  CX and MX power domains. Shared Memory Point-to-Point (SMP2P) provides
>> +  boot, shutdown, handover and ping/pong signaling, as well as fatal error
>> +  notifications. The subsystem exposes a secure GLink edge to the host,
>> +  with doorbell interrupts provided by the Inter-Processor Communication
>> +  Controller (IPCC).
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-oobmss-pas
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    items:
>> +      - description: Watchdog interrupt
>> +      - description: Fatal interrupt
>> +      - description: Ready interrupt
>> +      - description: Handover interrupt
>> +      - description: Stop acknowledge interrupt
>> +      - description: Pong interrupt
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: wdog
>> +      - const: fatal
>> +      - const: ready
>> +      - const: handover
>> +      - const: stop-ack
>> +      - const: pong
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX power domain
>> +      - description: MX power domain
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: cx
>> +      - const: mx
>> +
>> +  memory-region:
>> +    items:
>> +      - description: Secure firmware carveout
>> +      - description: Secure device tree carveout
>> +      - description: Non-secure firmware carveout
>> +      - description: Non-secure device tree carveout
>> +
>> +  firmware-name:
>> +    items:
>> +      - description: Secure firmware
>> +      - description: Secure device tree firmware
>> +      - description: Non-secure firmware
>> +      - description: Non-secure device tree firmware
>> +
>> +  qcom,smem-states:
>> +    minItems: 2
>> +    description: States used by the AP to signal OOBMSS
>> +
>> +  qcom,smem-state-names:
>> +    minItems: 2
>> +    description: The names of the state bits used for SMP2P output
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - power-domains
>> +  - power-domain-names
>> +  - memory-region
>> +
>> +allOf:
>> +  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    remoteproc@1f000000 {
>> +        compatible = "qcom,glymur-oobmss-pas";
>> +        reg = <0x1f000000 0x30000>;
>> +
>> +        interrupts-extended = <&intc GIC_SPI 86 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 0 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 1 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 2 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 3 IRQ_TYPE_EDGE_RISING>,
>> +                              <&smp2p_oobmss_in 9 IRQ_TYPE_EDGE_RISING>;
>> +        interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack", "pong";
>> +
>> +        clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +        clock-names = "xo";
>> +        power-domains = <&rpmhpd RPMHPD_CX>,
>> +                        <&rpmhpd RPMHPD_MX>;
>> +        power-domain-names = "cx", "mx";
>> +
>> +        memory-region = <&oob_secure_mem>, <&oobdtbqc_mem>,
>> +                        <&oob_nonsecure_mem>, <&oobdtboem_mem>;
>> +        firmware-name = "qcom/glymur/oobmss_tee.mbn",
>> +                        "qcom/glymur/oobmss_qc_dtb.mbn",
>> +                        "qcom/glymur/oobmss_ns.mbn",
>> +                        "qcom/glymur/oobmss_oem_dtb.mbn";
>> +        qcom,smem-states = <&smp2p_oobmss_out 1>,
>                                                  ^
> Normally, it is                                  0 ?
> 
> is it different here ?
>

Hey Mukesh,

Thanks for reviewing the patch.

Yes, OOBMSS uses bit 1 for graceful shutdown and bit 0 for ErrorFatal.

>> +                           <&smp2p_oobmss_out 8>;
>> +        qcom,smem-state-names = "stop", "ping";
>> +
>> +        glink-edge {
>> +            interrupts-extended = <&ipcc 56
>> +                                         IPCC_MPROC_SIGNAL_GLINK_QMP
>> +                                         IRQ_TYPE_EDGE_RISING>;
>> +            mboxes = <&ipcc 56 IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +            label = "oobmss";
>> +            qcom,remote-pid = <20>;
>> +        };
>> +
>> +    };
>>
> 
> 
> -Mukesh
> 

-- 
Best Regards,
Anvesh

