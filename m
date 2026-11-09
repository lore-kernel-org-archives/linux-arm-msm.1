Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794215685;
	b=RPZaCahvBBPVwELB1aEJrVqAPpSNvs5ICOlfGMCmW/a/Ju5HC+NmEvzOVKrs8AIDEogh
	 HgGRoichQILM46ewl4X576i+A/piKXRTPI2vfQ0J/tDQPW1Tt5YL5QXYo3K5hjLDWUy22
	 /0XhE8Fo57nJxL80DB03Xe1qOzX59rod4q+/gigjIub/vQfVy/uTAx8mcLsW72ojfBGCT
	 TR/KTrLUYzjgX1lUSW74UuqlTvpHCuiNg9urIaRVDSOXVS5z2y6zj53nPFX3JhHUMk4T5
	 9wRJjFbvZy8dXgJ4KUQyD7Ca0Pa27m/wjwCyyAwQ+JQ7AVrmW8zQXGR61qLBBxlA1ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
	b=hLH3qVqLnaXA7C6SLVWOoAG8cRC/eCaIdDBjl2y5tBF9YPU+XDoJHwvnIfLpeoCNLbsV
	 vM4kNUIM+KxZgOKSw8+QS6mWe9J/c7VbIQU+uAkjKTWKXVEZBS7TkgWUJ2AUwss+o+oK4
	 9OMmA4Acx8ubPS60R4bjUvIqKgLJWjJpjgtXwTD0kWoI3sUYSfE2rr3BudkdiKkeQS/QS
	 WFT6DGW9LJC5aP0+76K/dR7QcGDBLwhsv2aElsLc7JUMH8zYRls/mkXVoe76gHU5WqYyP
	 6kcNNyo/D/GDjgciMCsISDgDhk9WLhcB9RFLcaaJ6crkhibDOd1l7AUNZm87T8Mc+kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVfpLeBo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRuWLWCd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6D606A321
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E6D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVfpLeBo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZRuWLWCd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A8pk056083
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvY4KBfiISm+CQm5KIDUrtb6
	uzBgUaP0PFQaZpqv52w=; b=CVfpLeBo3svBArcIsMoE8xRGgAiB5mlup0YLE+WU
	miqzZlFGvtGNDDsox8E4acOXK3gFfIwXz4N9NuUoFgsvQYzB36fLfpJjeTRHqc6s
	uy0gSyaVcClNbyTOzA2q8KZ6eX3yeJTqJ/ms2Qw2AhTUM6hxMMbK1fitbXikNI1A
	3N1EEpVY6+IW/Gl778ykaY1gR/3PEmrnDIUD2fTp/fa3Hmb8ffAS6UIbg308OCav
	3+Nx4dhrSnt3yHskSXih/XRxBQbXscbe0NIynFJkTP78h6opo1QkdQ+HiyPEGFcV
	CwIq9i7JbhtLjvjXIsVC9XTOcHDqrOSl9f6bgU8BbCtJVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm2efx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:14:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso134964385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794215684; x=1794820484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=ZRuWLWCdtN65wuVlWtWaew5IbZJQV+xs/PnELoRFpgR+THgXzTvZHHOS6lp+q9i/63
         vG1RLNwSZy/EKgkhLioQy9BvJu6DTvuI72ZPuG8/ZNGhIX27xfpTPHxjQspokzT+CS4w
         mq2ipsL1uBiZh1A8Udd+SM9ptm9xaw9Aazb85UGx3wPDnivcG0l55rJLyxme0XB0pV1N
         ZQoZ1fCQPdtCa7a1K3weoQ5WiLHJL7xD2cFw93ILwjd1phhIsepjgI/zHFTyWW8S7+94
         YChlXmlDmtQB/vMWu+nkqRbdYGmnJ5OOssgzpkC1RENEguS4LhadiD01PH1aMyZUHojQ
         QMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794215684; x=1794820484;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=wS1WJ5zki35Cmj39yA3Wqu9FSba06Z6hrsbnmqBAtF/Ce7d0yW8US8IG1XWFPAVnn/
         meDAoAoVixobyjzQM1hbHTTMS/k5lLR70tbyKhJIDMmWLgjGEEh7I/eg7F6hj5HFkKvv
         5XG5H684V9P+uC9lhe7mgLEMiQ24fWpi/4gV2rO+4vdOVnfRPLLKfXmuAsewNkgR7aIf
         qnejA+A0RLiUAkQ/R1Fy9mwvLQRUrbzLjD/AQcE9ukEzp6S0L8IpCyiiHxSey2/9O90I
         SWlNRl6GftFyrrKxftf4YLRA8GoXbABGauKGmdH/Ptj7klsWg6i4g6hHYmNZQo6PlYug
         B8tg==
X-Forwarded-Encrypted: i=1; AL+hErEF1dvjsKa1U98tPPUV5lCPI5Bnw6KcJqtZfyUHtHEzsp0uvxQbVSOGas587K0vZoGRLsMieTjKshCrOI2W@vger.kernel.org
X-Gm-Message-State: APuU4Z9xr64pRE+Cgh+5hI8/iPX4jRB/PN+JIWpTRPu3v1Pnevv1B8Wz
	5s98WkNTQ5qBxLJlprKqFDIzlCOApzJpGehyhiRqMIpe+/hWeDRFl4H6bDdenBru34poa0wYi+m
	PQCAvJkK3y2b5A2dQZ5sN3Oh1qWsi5d6BnGWHADCs8PfGxQSds7D1/fbJ87qBJJtbSvX6
X-Gm-Gg: AYBFou2pCDxjnL2J/KnMbxyFc4tyecTHAZaEOf/ZcXxu/xsOf07W4FuDSa+jrx9ZS1p
	p47JPvpy9WRmQP5w3/XM4nLKmiKo07rD3P+LgoJhnxucP+I84e9EEO6BZ568DzAdhk/+ujP6J0Q
	l7JVhFS7IagWXfrR+M7EcBOwkblEHfJ3w7qpg21dEHnwD+TVekOOUINq0/mPV6keKkHhIPrWf9d
	a5BnRAliTS+CPWIOKSzrm00WAQBlTeiFa42qrCND9XUZAdQ91QB0u5taiC/BCcJmj/gZRAajag9
	9xQNrvICyO/vKU87E0hxsgzKfy2FdTjoYE5fcsuCJ4vyREOSsNVht2VzJWxUC3TpzlcSbXh+ro6
	5GPBxriUrnPSLNPaMhNawUFY0/6F0rVnawNXmbCrvA3b2KWItn/i/9E/WuD2T3kE=
X-Received: by 2002:a05:620a:1a16:b0:93c:65e3:df81 with SMTP id af79cd13be357-94604d2c6e2mr886327785a.13.1794215683470;
        Mon, 09 Nov 2026 01:14:43 -0800 (PST)
X-Received: by 2002:a05:620a:1a16:b0:93c:65e3:df81 with SMTP id af79cd13be357-94604d2c6e2mr886320985a.13.1794215682798;
        Mon, 09 Nov 2026 01:14:42 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795024730sm161196965e9.4.2026.11.09.01.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:14:42 -0800 (PST)
Date: Mon, 9 Nov 2026 11:14:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Cochran <richardcochran@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-sgx@vger.kernel.org,
        selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Subject: Re: [PATCH 10/14] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
Message-ID: <tr3hhmd6gqvvzrngazyovx7jfbw6k45yjw2mipqu3aegsy5oda@7qromidf5btb>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
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
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX9J+d8QGq3CJp
 U6c67FFcuJec+k6OoW+gKefEZTU3HtJmqVVmRFn4udNL0W3mYO2HckmAxoqgwKC6dXJq0kTBDWc
 YnqF/D63E0wfrhr0am1rVFuXfVQUBXk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNiBTYWx0ZWRfX1OidwvKChI0f
 dgy5OmUySHz8jMFcGs3f/ewf7FtWC3VCZQIRHa9WidWOeHE0wNakZc2STgDAd2Spvf2wXWRBzWO
 /FjvftdIsAo/JYDq3elr3p/n4B5P4wg8/1U3V4JtcbIubb22/rlcJhqW3B7uwTTcjg99L9N6yf9
 M34LdqT10m0XjlMrfeqeAUZ8mCPHsoyuf5eqbzgOHe7t/lRmX6nG7cyXB/qRQ9C4Fn51EB5IcbU
 MZXvBcLa9lA0nfsPjjTyyr3T+v4ceBiQSrPwN3GxASc32H0UqZfxvCJzuXi5v47HyVPeRt5DPWm
 sapGtRC9RX5VCKLAidg3U0NR5goHpQsjasHfhj3t8CRR0nwzjuMcfgtPfQQy1y2LBP0WFrMczea
 mgIqxDG/aUeLNpOtjash0f9YnNDZC3RgBh29ilBK59egNe5YPKqqF6cxmrHgrfuwdiJiC43Veld
 Qos5X1bCnXYCe2bCp2w==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af18f04 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 0J6BlgLKxLB3KYv23znmqXBsK9yFls_A
X-Proofpoint-ORIG-GUID: 0J6BlgLKxLB3KYv23znmqXBsK9yFls_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090036

On 26-11-05 21:05:41, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the region.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
