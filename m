Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492263;
	b=4BfDAEWBmDm9lTipw6kySd9z5e8HOtZ7H/nd5GfEp4wI78ntacL8yrFu5RV/qgVfb8Me
	 cu6vFKxtSN9hmsk2n8igOFxZCoXCMD5TadQo/rDpqhsCswRyF6sS0BgjrBqG3yD+RFXbr
	 NSlFMgMNTzhe5bmJR7XzbXjdfvkyHFf8D3mz+HahvpO6a/QdnwFBJE4wWV3A7rXDVp2ty
	 cfrBi3aRoaQ8/bUYuxdGZmVb4Y0qHvedgRwp3fmiCwRtjvx93qq71PMiWZ28D0r5cr9Lg
	 dOs8QyP8op9YUc0KUWP92TDP8Qq4+VBypAs0wsiM6EyOhm78glY9c1z2Ll6gqgjZ1hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492263;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
	b=4ymtqm3E0MzSesM0nIDpxdG3ffqudeec6OKnlF4wDODMmlR8TOFLX6C90x/xd7VAvShi
	 Zv6JCaFq9UQNPS/8mHuUvD+2O6ndZWqbxlpAH+H7l5i95iWsYc0TLyPpwJyJnN5MEWO6A
	 TOTprjRGf33XRPyfwGfJWyz211XJCx5yZBXPuCRfprPMWozmaVw/0O/ua5/Qn3qus8su+
	 ruYH12vMFMSuXfdV+4GxD3Hx4A7zydvrc9zeJ8BvJHYli5W8KQ7iBpJS+4J1zJU8u5oxi
	 hDtV21EAKITgrDGWwYCcVHf50h/F9WZ45Xr4VEbmHxrmwo/zVsvss67XKgev784G5Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Pt8mT/O3";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75341606A8B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75341606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pt8mT/O3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zkdyv7FZ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACB80353893075
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=; b=Pt8mT/O3E+MdfLZ5
	irvIgS8uLB5HnZNSkjqw9uCkzssqONuDPOuy5kilOtAmiJYPSUIGSxF9D13buTDW
	+aiq1LxgbwgdvUSAxVbw1ePXNqBwO48/h8xDkJyoNw2v5Sye+5IkGZ5mYZBhXSek
	9IbJYB9tIVir/trXeHtT9QBeG7HdB6KhiLrlaeALCLDPAhar3kGWHDWv5bKoDo3y
	b1Dsb+rh2gEqjZQn5RcwKEHhw1XJjnEJ/9RV0rfBb56LC0GBgri8dlL94paAxjrr
	w1g25DSeUfIxH8cy9wY4Y9eKbEvUgEKPcm3YmIbx4AGfryQISQPQZM7vH49th1Rc
	Ed87YA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1w51-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:04:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so8127540eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 06:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492262; x=1795097062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=Zkdyv7FZMAup7d7VcnxaVAem3tfHj5MSFqZtrqcidXWFs7hcaVhX1gf27oHzB2TEEB
         kvMkGB0vbGlN6Cd4G1y3J3mO1SN+/1C6MGibdA/X4cUpEUXNV7uVokZvfuX6QJ+Poyam
         zFs1Kc81Xes1FcQ9nO/+M2sg6VuLXuIdD/nHbbswzwV0de4ZZH0TVrlDt6tKfU1GtRI1
         qhvF4mjdOIDWI3rrbHgEk3cUzd6nn/pxW02mCQ6GM8vh8zJThB4l4CWFEqOPXWgftQiw
         iua5SuEaZsKOZPSst79yXKuZHWDTzmjEXt3+cVkHS4UhCuYfJcf9jA1Q7mA3tr0SxscB
         Me3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492262; x=1795097062;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+CH3/jx2KSH+RRiLFJDBQonfvkStMqSF3XdFCzZT8w=;
        b=Dj+djvI4YyTOf36dj5dXSX5bZaDf/YbkKglZR5mos8XWtcP0E4mskaE/4BaeuoJst8
         1X6a0yZmA6XR9PhkmhkGdvlfKP2JmbxGhQwdqC6rOnqgpSierceMDxpbB0qZE5xZX7rZ
         ZMaFsadbIKGltkw5vcAR2FnETJ01tSi6LEurIHOoKzBKaQajKfFxSY2JCjMSEd8HIa9a
         xpsJi/75/mWcQHNNnmn7qRCdU+rU3bKhx9NJMJxRIEtpTDj2rf2gdKibv+yB7k0C1LSZ
         BPnocP4j15uTk5l9YxbGLwiWRnbM9bbktauGwZwsVV6M4+0Qe8VW6Y706RUezJc0YTG3
         anAA==
X-Forwarded-Encrypted: i=1; AL+hErF+zDsDZi9amnnq9n/LeqyypzpnvByguEpfX6dinQYjcJ46JcCAB4uCkteugbWftHB5vIWSYSNHfwnwvrRZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9+7v/kIC+MF2fJg/CTQJ6AbObDaA8M1qYnoxLgy0Ld9eLaRPwG
	ETBsLZvaOZSvslU3kREtJd+OOWOtc9d/n8XM90b2hWpwzaT17pn/INZHeOz4MHmFR+c08/VecVQ
	Gy0G4rLqQDLVeRgzJuSK1aHHsrmi5wkj3lMAlF7sXNJ28wNAZmFpFcOSlJhZKlY6bGJ+L
X-Gm-Gg: AYBFou3jrJ91AUHp+ESE4JT8VgWtEWnbRLTxfFv0DnvmVTa5hec+v/ukgjLgpDIK8O0
	vTRosN9ARCe7vTKAMMze/yQLKGfr+FRXcSAWxdeu/bs+qnAOs5KPYVxN5DpDv7CeMyUQkYSwaIn
	RP3sE5jWHadiELHRABqo7EDqOeT5NHLzgvi4ooZ+vi/LGoWAbdrq8L6OQ75avyQUSqxL7LkR/DE
	sSFHT9QVIQbWR7YFh4B83N78Hs11y3/SPjJ5zwK73bmwiMbLjcmUKXKPZwQkE5LifHsXRSd6cfq
	JW1PpdGxgh+eL9gi+StS7iaaux4cCgluWJ24O9fSxIso+dRuouUed5Fmnrs0/JicA+Y/2BW1A0B
	pRzh/6ZL+USnE/DhKjEq6d3F7QEKrhubfnEPgzMncfvN+6SvRszU9TlYiZfqpZ2twS0o0ZfYo2+
	E5nKGh
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854452c88.6.1794492261723;
        Thu, 12 Nov 2026 06:04:21 -0800 (PST)
X-Received: by 2002:a05:7022:28c:b0:1b3:bae1:f5f3 with SMTP id a92af1059eb24-1b3c023c99dmr4854412c88.6.1794492260879;
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Received: from [10.206.104.93] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5029ecb1bsm14027c88.1.2026.11.12.06.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:04:20 -0800 (PST)
Message-ID: <97c4eabf-16b0-4e3f-8aab-1c56912c27d4@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:34:11 +0530
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
Subject: Re: [PATCH v7 4/5] iommu/of: Require reg for iommu-addresses
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        virtualization@lists.linux.dev, devicetree@vger.kernel.org,
        kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-4-5c0f72083e52@oss.qualcomm.com>
 <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <3713bf13-cec6-4b02-a29b-8f76070f03b3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _47uHOF0pv1xbPgP0V58Rs7RR4NOeuTi
X-Proofpoint-GUID: _47uHOF0pv1xbPgP0V58Rs7RR4NOeuTi
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5c766 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=DrYjplHx1sOd6opfFz8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfX72YGRmOrKahd
 k0SrMkhJIweGPa59W+q6BeBNtwpKrDSe1r3jyRJoEbQg3BEewoxNjPrAv76RvR1TdCK++iu8M0H
 L6Sy4CL8zRMvVAwtB3FV2umIfN4I8R4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NSBTYWx0ZWRfXyAL/6/p17d53
 oMNN25eyLq+tu55kE5NdiYmJVCi6Z+plhggwCkM4yEcnCxiXSEOLVBLtjHyXHIi3u7f1syKtu46
 rZV9rPnICPPVrybf7edn7ocR0ehxq5b1xw/s1bWIzC6Q/x4pIJo0/zB1yFDA7PPCYW7eKe5guL3
 eMRXFEspllUenf4nbdRy8wOlY56sn0uqPaz4IpHO5CvKtOYcF37LhrDDPsZM3NiIe2s/xGDRUtv
 uZk2Q9UKI+QYt2iIKzzAub4nIv/72kx5weM8wq6j/a4yVsdsRP44AcIQznjoAI4HfsTMEqrbIR6
 CTC+t1oKic+RC2Z6Hg+KVHhzSJb+wE2kg1DjfSPylQOMa7fkdPm8W3Id2Z8fQLGSD2BJ4PsLLoi
 lrA5M7V1iPW+gEK4ruV1UQKhehw2QdvfQA2i6JOoxir4oxFhim/+cMqsLo3qCNyoAB6hS9+G2+k
 NOmWSWWbyn1550KefCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120055


On 11/11/2026 5:32 PM, Bryan O'Donoghue wrote:
> On 06/11/2026 17:14, Vikash Garodia wrote:
>> @@ -257,6 +252,9 @@ void of_iommu_get_resv_regions(struct device *dev, 
>> struct list_head *list)
>>                   }
>>                   type = iommu_resv_region_get_type(dev, &phys, iova, 
>> length);
>> +                if (type != IOMMU_RESV_DIRECT)
>> +                    continue;
>> +
> 
> This change is not about requiring a reg though, which is why it should 
> be a standalone patch with its own justifications.
> 

This is about reg, which determines the direct mapping, hence the code 
is very much applicable to this patch. Please refer this code [1]

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/iommu/of_iommu.c#n223

Regards,
Vikash

> Basically the patch should state why a mismatch is dropped instead of 
> being reserved.
> 
> ---
> bod

