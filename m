Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462412;
	b=1Y3bXU34+ytmpcH/pjBtej9VvPL++fzc5UyBx12H6F85LqMJRbPSRQJG9+uf2mZ2a4cM
	 2Th+43UZHbLwRlk90sQPOZtH1r9Uq9WeIUVu7nJnVjAd+iD8bDMf1B/JKBfrQ5bKFoaVi
	 K/e5xCNju+D7+NvExds6tnV4L7wflcw8wNpDxu+3Lf01MNZoZY74ofeVGyG8XFR6veb2+
	 EZlKQtgknbE+pyznb05KdGQvTzqTA8mt5G/sJ8Si3VAKeOEIjdvLrwlCgZvJbmCj+LKv1
	 qY/w9NWC+qFBOEC76R8EnN8m0wyu3JyZ7AoFoSQfO3bWeD6mhJSIuJpru1JwkrTV6ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462412;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
	b=Rk1SY1iE5Xtx+54rlsM75/nqrVCVBgBDyozAFr+l8zafT1QFXTEEBbs3gIf7a51+8e0a
	 ufdAWiVeP8BuNKmuvCLTQeFoCROrPhmbyD0q3tFHFl6BOJrkD82hwZ8OQPkdmsU9ogdfO
	 iq32cE3hzHNKwLqAbkPOJHuhHvuxWbhR2tJ5loWd5t/LNMq3zNlsI1uu2hD8RzaQ43fAL
	 +jKlmDHdcy3Xc/ljXQS1bhWfcpZgzk/8GUjQOUuUB4WTSDDgtZvqMuK5yUe/tlkyMK0JV
	 o3JWboOBNCIz9DK0gABGVwQF7efHvsYshbQo0kmJJLZV/6HmULoLgmnpbQ+cDpE+KcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="lbad/JWJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B46606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B46606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lbad/JWJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3UJkNfv
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH6GF1093937
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JHSEjavsqM39bkuCvnDFdHwV
	3w2gEjGXKFceSnNzYy8=; b=lbad/JWJZ23cBq/OixXbP4rSo6w/e0xsnm36Ki/+
	/HM51Zy3lNuoHUVZ3PkJybcQulJI04EEcxSgw9tGFNWpx+foTSe9TFxMc/zUqm1W
	92LK1CCCln2ZrcP6QuF9GZiZGAua/iJllR56i/Fq0JV7q1xqP7Fpp84YAPzUdRT8
	Owx0HqCj4jMgqvMmsrgYct3nE46PmYB4mz9uker/P0p9aUBYNa2RGAfqvPsugBmt
	BSyJ3lUjKHNWxz3Npz5vswwEC9OcGPu8p9nAZcGLWmhNgd49ex93dx9Ejo3qvGcR
	QGY1a4eugZUay8SX4qcbJNMm4wHxCtFVsuASfKj2bO1g2g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0t1t5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:33:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9213c7a506fso8440216d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795462409; x=1796067209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=V3UJkNfvkYFEiT3bOJjoBztZaUrSNwinbxmtvpvrnOgcBK1JdpnWw3JCAvOixfqNfV
         emxRSp8KGVOoRRnvJANtA+FLzM9AA22v9hIHjw/xQvjC7295xWlTUYm9spXSXexvSNcS
         Og5ZrzoBLMPGTfpprr7WeqV6Vdh0kFfXcJblAONM35qpqNUPzmaf8OqE1BcRTXMRibnj
         xYoYNG39bkvp87ZoMiL1MOT75xwd2m0yqzaXBgPzFs7rYSRKFZD9AZE8fT7goEK8FToY
         oTk5O01rHcfND/Q2sG9+/AK8VmtQwu0TK0HpL1UDRcpIrbxhBhtIV/+Di7M9iziPHo//
         a79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795462409; x=1796067209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHSEjavsqM39bkuCvnDFdHwV3w2gEjGXKFceSnNzYy8=;
        b=pOuNv3XISq1dlKMifb/rvW8S75Sp0wJ4F15Pm538RxcoYDwPXXprTsh6a0RBZatvbf
         GQSQNpJq/eGXII2FoFUGPR998nmhE9vL1cHc6RNRVRuo8MySrOFURIq6bGEm8KKuZlRI
         gg1AGtRxY4hTXxOWWf8nkQv8I5ElQEqFhqGC/lAeuTtQ+fzYbXLXNwntY2V5WRYxtHYq
         RswVG+UJPQem1L9wsKDr4KQsUZRhgyE/mWJaeBb+7P0M3r0lBRabIccjjYr4j+CHT49U
         gg6YDlkdEwHnJeC4s30l+ICuEiv+6Youn3cXXDEO/6782ik8DFyngcnllQsXczMuaqES
         6SxA==
X-Forwarded-Encrypted: i=1; AL+hErE8y4AXKfI0mDocGEwsZRPj3xYGoI/CkjKoa2iMl3LvsyShwMEhqzjFaIhnt9b2+AqD3Nadsj1FpipuGJq9@vger.kernel.org
X-Gm-Message-State: APuU4Z9vEWSy11glgg5OYVr4qN1hdntOut3/iSgLm14UGdBlc4+BdwO9
	HctY5KzNMeuMq/4hJlJEinw/LOajr5JYBF2GcwgwZKIEiw+/MJJDx16XvoYBfCHdkEjazyhfdS4
	TOwYyZ2DjBk0LfdESivohtgg/Hj8pjSdR+g0mA2as8j3Ge3tAhPpBYiTtb5IJBOsJYj7E
X-Gm-Gg: AZFdTZelIoUFvmiVifeh7VAZVDZnsBLcO9yWzlr32C2hQ8S1sfe3X+GxvghKSOA4F6K
	aog+hN3V3DAhQl8ckTksinmW9+fO8GWdf3KPhxn17CDCR62h5M/nCvjTEctApRZ2bWRsAR4B/Bg
	J0rgEbtUcOM+uawVwT+TkSxU34IR3O9dMCcKsRthnuD/7EBiOQg/3vucay92OHJd8l1MtEVsksg
	qCw/Yku+bQYrQfjbzpzoGPzWYOj/b9zxP5Bo5DU1nxFQv6uUV6aH03DGiP3S2j5RLUUGG9MPXs6
	c7+G2uNr+GuzN3JjsY+ZOBhGAFQphmnRpp9J4W0JENc9wOZu8PGGd2egjETlrUu8k8zs7SZGZl9
	hf7X876GQTOhvKcPVK9YvIVxag0OXe06nwqTLSaQzU1rOP2B3cMSeK0YVTHhJ4C8B
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962699085a.0.1795462409203;
        Mon, 23 Nov 2026 11:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1962694285a.0.1795462408555;
        Mon, 23 Nov 2026 11:33:28 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm153451815e9.4.2026.11.23.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:33:27 -0800 (PST)
Date: Mon, 23 Nov 2026 21:33:26 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sm8750: Add EL2 overlay for MTP
Message-ID: <hlj4ucudy2shejlwc73qtviz7yasoyfbcrkp4dnkan54tgzru7@tfdtsgz2zhck>
References: <20261120-shikra-el2-v7-0-9d9000eb50d4@oss.qualcomm.com>
 <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-shikra-el2-v7-5-9d9000eb50d4@oss.qualcomm.com>
X-Proofpoint-GUID: 42bocz969BPe_n74ppWf2EtZuSSy75hu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX/8X0l1JI/2GA
 VzHwOV9o6ZPo459KDVt2LrQuXFnE0yG+ZdTLBc6qGdOcH2M9Njh312Q5uczIAYy1dk9fAfeiAll
 2Idsba6VIzCb3oGsI+fOEJkfN/U1YI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NyBTYWx0ZWRfX7jE9JBGjMY0R
 qAGrMyI7PVscJZRogFBaYCzqmTUnycNJc71OnGuS5ovP8xO7tcY7R6klyTBBeNnpVPmSI/rFaGK
 Y66BebRkeNSgZTJguSxChaCulTTkvMmamn9Z6va95SjyK6LKVSSTX+R9VxjNb67i5ssAaiKm0zK
 yj1rh6xr9AY+npYI3GGuIByRmHWEX77E+WI8wOEDxoAOhxqVHn+J92ITihYzlknPHNLI0mBDxfK
 1s0b2qh2cjOMaovUq9B4lVhrbtIrg/QRiLWr5rLq+j0TBE9yqXYE3zmMp4HcLg9Qy1GPEwmbpwg
 5jlkXnZ9MZMfmw3AblKEe86Pt2KSAPUqkqjg0X0xz20hg6fMImfQqJe9d2iSwGZo4bMqNYXgXPg
 F/RkAe+H+Su/MwlblrYeEPkdVDS4Opui1a70a+a7wvwI/dy/QMK00YedO90tcw1DdbboaG+HI6K
 ccADLYT5Zhr/yqK9bYg==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04950a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RR6Oj5ZeI5PBhayghEMA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 42bocz969BPe_n74ppWf2EtZuSSy75hu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230077

On 26-11-20 18:50:53, Komal Bajaj wrote:
> SM8750 boards boot Linux under the Gunyah hypervisor, with Linux
> running at EL1. Linux can also be booted directly at EL2 on these
> devices.
> 
> For EL2 boot, describe the IOMMU streams used by the remote processor
> firmware in the DeviceTree consumed by Linux. Also disable GPU zap
> shader and Iris video codec.
> 
> Add an EL2-specific DT overlay and apply it to the SM8750 MTP to
> produce sm8750-mtp-el2.dtb alongside the standard DTB.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
