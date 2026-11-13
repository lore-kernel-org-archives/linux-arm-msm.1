Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562600;
	b=K/kH4TkIuM0YnJMuXLEN3rq4SUnWdq+YuHrnw+Pih/aQntPSj+Kb/H4k04WFsorzsERc
	 LvSyxj1CDZj2ZLMaaYGzoY1zcgjSytkkAjFwKqMlg1t3ftbaWGWqiHOeqCdjdeyj+RrKQ
	 cbv3Mvs+bPuxDKeGlzyNuemDx5cMzGQgrKNPnWcVOiQBdBoBuI2jMuaJ6zHRQF9YKMONQ
	 RQtpEAX7R6SWYc8RZOBkKzuXnGEOhVZqTvy5AaKq/47stDTnAe0EP+RZMuvZDjmao5KKf
	 bqo2CLSr+xH3YLIkv1JR4ogYsAevxDY7yGnWgrr98Sg+lgOUMz4Py5HMHr7b6AhtaIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562600;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=;
	b=Z4gX9YwC+qy7rOcb/wmnJL8ed/s10ImlthNDLBmqp8dCMSh/SbuhAgfOoZtS87p47Qac
	 eNVgwSBvfCTAENBiwYcpVr0mHNh3ZkPIyGu9854n8ZZVaZQTGeQN62Clik2WRzptxU5i5
	 fUCJS1wHuzoBu6w0xr5hTlyneYMxRCDu/Uzot+e7nvWzgkvHFVDcsh9ZfXHXM/RXkwQK5
	 Mi+w2s2UE/E8i8+E6KJ3h3VBN2z/FImtljlr+XtYeogM8Ji5GJajJLTCnbKMf0fJd86c/
	 XfTbmxJ7wV3fyLiqr1bmCTVH+Z+FCp4M/VdCEaK2HgMRoSRDnXfx8gSsJgDrGI8fZrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GVKFGMs1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wak6RPD6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BDC606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BDC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GVKFGMs1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Wak6RPD6
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8V6Ff3652843
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=; b=GVKFGMs1XMs9bbXp
	Zhg5r5J6RwMc42vPpYNxUdrGnsI4Fhw2BdDU0rdu3o0sFmMKaQu1NrcR2rTbbR8R
	GvHPsp+4adGh3QtD7FPMoBIFtRHYLVkbyZChjnR/NLvCdmjR/OrbJPj7fl4qeV8W
	a1ieVPsDJG+7JDIGNw/V8eBuedTZbN9Wy0yyelW2uvkedT6T910Pio8zORxPVIZq
	cgFh3n80GjMVVrvJDu3INzRywdH0D4acbetf4CAQIkFyDea6uPH4cEbOmx5UmaHp
	nwj/BjflK9AxQPPF1ZvcJ3MYKU+dUoOYlXPQrcNKRYBmmtJfK/Ul3Q6ffcQMlx45
	ZG45lA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkgwadre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 09:36:38 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so933009a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 01:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794562597; x=1795167397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=;
        b=Wak6RPD6kKAJD2xcOzv6C5pG0152NpqFM7/5txgIakOVGBBCW9mPOqpc/pMIeLfWXj
         3ULZuTnfWPFFAvo9Wa4W8gPIvMYbtquaapskupEKbVPvOmrUW/c4IAurbnXryJI4lsvd
         KrZiayW0emk47CGdeDDttkmvtQ35McX+vLZyuImModRddJIAUa4opiCdlShS94U3YKUJ
         Oz7gDlnZUV4bOm+XSB7bot3Ux4GvtL9voAQ4NIvqu7EnWrgc/31kFvS90bnrjWBiuSab
         H8TcLUW7ZMyTnAv9l3JlI1LZSce59CJwaQJVqMd0eqidWGLUP8vhnMonIflK5AfS20yV
         AyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562597; x=1795167397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLsQc2gUWWCsMRZXIeMbM6mV7EAFqw0z8J6u3kCxlKY=;
        b=pYUrnp9ZCxGXCHrjakFR6DgnHhoowCKE5mjiZWoNZrzdPAf/jbZ1Tzzt88oYsEr9t0
         Cy4LHTmDOiEO4B0zJgSQ7ON7SV3wSiaVF5uNxTAAb21sxrs7dczmKLm1ZTSP2iz45kfT
         dOG6iu7lVGs3OhkRmb8npA9af5kNwvx+0LfoCykqjpQ0A85zI0A2MoFllva1Ztay8URp
         skM2wUv6euNdlK1F2mTLB/sg7BOkeVmDWDdJ/l55t4VWojPlE+nlGHmOhZMChMnktUJq
         XMVbcH1B7d8cOuVDvyXaNE/aq0Brs3SCSMysSIA1EiMmSTC7KgZyNP+uP1tnuB/aTLP3
         JHvA==
X-Forwarded-Encrypted: i=1; AL+hErEIe01PQNt7TPkT/rkUIvav3gQpF7hYDugcRD0zhK1X6t47kkt4bV7PrCvvCLuqBexI3jt2j2Hf8OgaK4X2@vger.kernel.org
X-Gm-Message-State: APuU4Z9rA0mcWtmVFHN/70Vh/Un5osOwW8gkp136r+7hecBeXQk0LdEY
	qUQIl/S4uY55CkksrJltONCm9F9MOM4RCSLs/ChkfBBG2s4rVhDdMJAulKpSdP6OoDq77MnGIzh
	Sc05Pw3e/jxjefsvODyAjUiXp2+ZDp6m6YYprMnfo5ky4izvs3vXqVVJBdh0RSErGS8b8
X-Gm-Gg: AYBFou1OZnVEqI2RJbHdEo/D7VB6MvY0nf4cpx4hcJtx6e7NYWzqxof0xov9LAYAB6U
	mUI0o9xSdSx4/ynDpkQYKRG/6mpnMphhvU0OHMkAFFH8bB70FjV7qIE2Tvw8wKcnIwHiLj4ka+G
	YbDjBbbtOKI/bha6+B+XsqkRR1gLefqXfXFEofI9C80+c73V2NGcJYMHRdFnxN8N1Wr1wXuljnL
	paodJ/dhrw0A2BhkvhtpRGerjBKDFKdc8aqd0msAPnwUUi32d7TXKoF96Zu88T84XM1qqrie6j9
	BlswLOxXVPJwVTCL0rropGjj9uJm8GCNDrj+k3BEH2eoMqU9LUyjtBZCiB87z6GwdN0cdwuGMZI
	QtMvFdTIoLUsOT8EJkgatEBRRsire5liASH5InYrt3sDi07Vk7O7YN24kX/8D+ZEzzcA7VDmpz7
	U0gRMuhLJ1LJ90JBUhdLJgv9xwKi0gQgxSd2Yxb0Q=
X-Received: by 2002:a17:90b:1652:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b1b0a42b8cmr1747874a91.48.1794562597472;
        Fri, 13 Nov 2026 01:36:37 -0800 (PST)
X-Received: by 2002:a17:90b:1652:b0:3b0:9317:5842 with SMTP id 98e67ed59e1d1-3b1b0a42b8cmr1747854a91.48.1794562596993;
        Fri, 13 Nov 2026 01:36:36 -0800 (PST)
Received: from [10.133.33.5] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1ae981c55sm3828201a91.1.2026.11.13.01.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 01:36:36 -0800 (PST)
Message-ID: <68bb5fe0-9005-4517-aec0-c39021a5b24f@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:36:28 +0800
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
Subject: Re: [PATCH v7 5/5] iommu/of: Add support for "iommu-ranges" on a
 device node
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel
 <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-5-5c0f72083e52@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20261106-add_iommu_ranges-v7-5-5c0f72083e52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DNgacCNb c=1 sm=1 tr=0 ts=6af6da26 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BUd8g3l6cCjgLUHkIXsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bqgTYH0ooMH2_4AcYNMeHj-DDFqz6XNR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX3D1P/5Ij7ES4
 tyqAaLl7zkQijHxaMT0nF0Q+7kN4y46UaBJ1WSHHsyyZwD80JqahiElJ8rPM1WIai7icPp7OTrr
 +kBpHXCQGGSFp4MeY5kap7fpcRdUlEVngOTZ7fYY4unq7tNI/CDjRuaGx/oQihMymid/dW79XTU
 yY1dlG0sqvNmeN/BWBrD7r7KyNrZe4QsvK885V8hibpljL9jC9TxB2KXuP2WwNeEzlDDYVB32XU
 nVAANNSM2eHQZpo/AS6VvtAX7SJK+qr39yHv3W1e1Qa4qZ38+XqbjPCrHfQhCjXE2l7pLxOwxHt
 k0opJZgnnVLWPa1ps0sfQH0LfvshDkNyMzj10aZxABCUHT/N7YENjOCpRrnpe/S6ORYiuUaezBY
 z+SdQehANwXSN6N8o2L3/7UBrvMcZ4H1v70dP0Oqg/uQW8rw0AmajSTdAPFVpDgOQ1i2nl6kiW1
 YdwHSNd0ZZBojL882FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOCBTYWx0ZWRfX4M4UG76NR2US
 RZmvWRYFVzKc6xCEqF/aogT05pa5q7V1Xryc3ytz8HNLTqX64Nxq1Oc5m1BfHgdBhjtfLkSSOvg
 byexvCho1qBcxvQTcZ1d9UFudO9+rd8=
X-Proofpoint-GUID: bqgTYH0ooMH2_4AcYNMeHj-DDFqz6XNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130038



On 11/7/2026 1:14 AM, Vikash Garodia wrote:
> Reserving an IOVA address using "iommu-addresses" requires it to be
> placed in the reserved-memory node. But when "iommu-addresses" is the
> only property being described and there is no backing "reg" (i.e. no
> actual reserved system memory), it does not really belong under
> /reserved-memory. A device IOVA range is specific to its own address
> space, and does not describe the system physical memory to make it
> qualify under reserved-memory. Given this, place "iommu-addresses"
> inside reserved-memory only when it is paired with a "reg", otherwise,
> define it within the device own node. It was discussed here:
> https://lore.kernel.org/all/662f7093-fb0a-4564-9ca0-98e03e68ba9a@kernel.org
> 
> Existing "iommu-addresses" property expects a phandle, which does
> not make sense when the property is defined within the device node.
> "iommu-ranges" was introduced to specify the device specific IOVA ranges
> when there is no backing "reg".
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>   drivers/iommu/of_iommu.c | 107 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 107 insertions(+)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index 00b02c19f27e195fc36c4bc1d91253255147c9ab..e133d3b346feecac7e2bfaec44e4882060ee89ec 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -183,6 +183,111 @@ iommu_resv_region_get_type(struct device *dev,
>   	return IOMMU_RESV_RESERVED;
>   }
>   
> +/**
> + * of_iommu_derive_resv_regions - derive reserved regions which
> + *                                are outside of iommu-ranges
> + * @dev: device for which to get reserved regions
> + * @list: reserved region list
> + *
> + * A device can describe its own usable IOVA ranges directly on its node
> + * via "iommu-ranges". Everything not under those ranges is derived
> + * as a reserved region so the IOMMU allocator won't use it. Entries may
> + * appear in any order in the property.
> + */
> +static void of_iommu_derive_resv_regions(struct device *dev, struct list_head *list)
> +{
> +	struct of_iommu_range {
> +		struct list_head node;
> +		phys_addr_t start;
> +		phys_addr_t end;
> +	} *pos, *new, *next_range;
> +	int size, prot = IOMMU_READ | IOMMU_WRITE;
> +	struct iommu_resv_region *region;
> +	const __be32 *maps, *end;
> +	struct list_head *prev;
> +	phys_addr_t next = 0;
> +	LIST_HEAD(ranges);
> +
> +	maps = of_get_property(dev->of_node, "iommu-ranges", &size);
> +	if (!maps)
> +		return;
> +
> +	end = maps + size / sizeof(__be32);
> +
> +	while (maps < end) {
> +		phys_addr_t iova, iova_end;
> +		resource_size_t length;
> +
> +		maps = of_translate_dma_region(dev->of_node, maps, &iova, &length);
> +		if (!maps) {
> +			dev_err(dev, "%pOF: failed to parse iommu-ranges\n",
> +				dev->of_node);
> +			goto exit;
> +		}
> +
> +		if (!length)
> +			continue;
> +
> +		iova_end = iova + length - 1;
> +
> +		if (iova_end < iova) {
> +			dev_err(dev, "%pOF: iommu-ranges overflows address space\n",
> +				dev->of_node);
> +			goto exit;
> +		}
> +
> +		prev = &ranges;
> +		list_for_each_entry(pos, &ranges, node) {
> +			if (pos->start > iova)
> +				break;
> +			prev = &pos->node;
> +		}
> +
> +		new = kmalloc_obj(*new);
> +		if (!new)
> +			goto exit;
> +
> +		new->start = iova;
> +		new->end = iova_end;
> +		list_add(&new->node, prev);
> +	}
> +
> +	if (list_empty(&ranges))
> +		return;
> +
> +	if (of_dma_is_coherent(dev->of_node))
> +		prot |= IOMMU_CACHE;
> +
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		if (pos->start > next) {
> +			region = iommu_alloc_resv_region(next, pos->start - next, prot,
> +							 IOMMU_RESV_RESERVED, GFP_KERNEL);
> +			if (region)
> +				list_add_tail(&region->list, list);

Why keep looping here after allocation failure?

> +		}
> +
> +		if (pos->end >= PHYS_ADDR_MAX - 1)
> +			goto exit;
> +
> +		if (pos->end >= next)
> +			next = pos->end + 1;
> +
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +
> +	region = iommu_alloc_resv_region(next, PHYS_ADDR_MAX - next,
> +					 prot, IOMMU_RESV_RESERVED, GFP_KERNEL);
> +	if (region)
> +		list_add_tail(&region->list, list);
> +
> +exit:
> +	list_for_each_entry_safe(pos, next_range, &ranges, node) {
> +		list_del(&pos->node);
> +		kfree(pos);
> +	}
> +}
> +
>   /**
>    * of_iommu_get_resv_regions - reserved region driver helper for device tree
>    * @dev: device for which to get reserved regions
> @@ -262,5 +367,7 @@ void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
>   			}
>   		}
>   	}
> +
> +	of_iommu_derive_resv_regions(dev, list);
>   }
>   EXPORT_SYMBOL(of_iommu_get_resv_regions);
> 

-- 
Best Regards,
Yijie

