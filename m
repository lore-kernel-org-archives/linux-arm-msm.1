Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53203392837
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486272; cv=none; b=nYHz0NULax4Fx2HUgL9w5SmQxzHeqSHHw1AifKsPwb29H5lmYgGSvvgNCM5Rp/1q4p/pD7cxTcAJ2UsBmvsUszjtlMZbCX7e4BR/G3xHFzBSEmZM4ly1XDwU7yR5y0OiGdMpAoTAkKBpjbkmToOBvuhgbygtUA387IBC3ciypgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486272; c=relaxed/simple;
	bh=XQHWU4Sfz1Ec70VbB2iTXlINqT/lml/fJx8mYlhLP18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr4fcsEseN0aHAMn8T1WZaAANHKpQOMtW8fu7WEpqY/wJ/2wOjqiiIEpDKvAuB+nbUlb/thqGzN/Rca5IuODr75g6KSiYMHVtSCTmKI+DWHm9PN6ALgY1FwNJtqdr5eHNSj76UBRxxwR54rRc8hTPsP7ja3z8AbM+hqBh8yW+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bQ0dltdB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abmKQJi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bQ0dltdB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abmKQJi8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V851dd3408310
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vit+XptqPqCCnxhnywKX7IwS
	S7nXFK9HQm7gueLuEL4=; b=bQ0dltdBamKNK3T3QpavxRkpXeIn6V5eandPz93V
	/wqQPhDDFSoL2fyZRMy/3uZJwD0D0djNZwWjziXvfbRp6HMjZJDE/B5PanHvIJSB
	rhlCedDYXJ64AGRefUmijq2PG8VxwYEpx5up7v45axWVnkZkdtd7ux/WadtPBWjS
	7cQ/N2vhUeRYUczh17QvQh/gHbzzzosRYXtKFx0uXWWdWIGrROw33Q4TBqzTPTo4
	iB/0t/BWBRI2gMvGYXW2YheJA3n2qkSbv6I9yXaCaLLbA6nWI8A8HKi04ATS+rLM
	jxTOTVgs3AxlTRlGJZQWLnxFO+p1WwK9Pdb8mV4/ASdYCw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqvsr276-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:24:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f73fso13641066d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486264; x=1786091064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vit+XptqPqCCnxhnywKX7IwSS7nXFK9HQm7gueLuEL4=;
        b=abmKQJi8vv6brmNSj7wIt9EKBm4vLsZMByvavqAee01BltWrZWIXCWZLb/xZOjXJjv
         oPBGnaKi29u6M2Eq6WPUcLvjtmKQdmwJIIyQVU9BpfBnBVpr23oohFwQptrGJ3u53JIL
         EOMiFA2t90o7ljLZCo0qPU96lrjCkmYpm1aokKG+FLOZhvtOSMt8YH2qKMcVLPz3UQcU
         nPiyMWEay2TSfdo0zqhIlv5SpFkEIun+MY3gg2DPBkUUYzXO7o9TfuoGz+iH5dvFOY4e
         tWqAc9Pdr9brfLsTG2ikdV25D+3zzFVQx+mejB/2bzmuTQN0K2+Yz/zpXp7OgeCWDiWr
         Da9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486264; x=1786091064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vit+XptqPqCCnxhnywKX7IwSS7nXFK9HQm7gueLuEL4=;
        b=hJUjtz1hlqQO6XrG721qmvd0TyHdzrchfMc/sY9aLm54gCTdqsFzOe9MsZCr6IS6qx
         JQ5qFGk4e02ITdi2i6jT/HOx09a3CE9JxApcVSV6qOt6gyUhzqg+bZwNSTFa3YmNcqOm
         nvogBNGHrjLsfevZB3TTbRDXe4a6bYveYgURFtWefeEPBxE3LJLiLSppyf9PCXhiesan
         R9NvT0mzflq5X+5XO74HG/tjsdeocxg1SE99h3h+JI9KngTJ+eXLF2GS6jnEiujpkodx
         ew5D9c/YeyEPzlvynWYakCEVyLwRUGp0Gh5mLvkLTpJHw3Df96/63HnvaQUoDCE8Y4g/
         LYXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr56qvRbUwrsxg2qFwHmwWSsxDOzY7VdO/Hiq468ExpAVsV3STCwaHoUVXQwGGPEIaEt2jUWHpA4ULzyV2F@vger.kernel.org
X-Gm-Message-State: AOJu0YzYGPKvZb+YRIhaZ/z29ZHZMt1XJScwwC87W7trRsWFc4Refg2G
	ZtQYns0qa8muHf9GGJKOKTjW4GYJqNKjbPTIpmsnvKAQlgxWo94SMJFgYi48/wsMFCOD0D+11la
	LcEmkddx+nRqP8kOUhp47kYZIBFcM5ovKVBopyVrm0jWlIVv1NIXXK6/WrIIgnOeyUFik
X-Gm-Gg: AR+sD102s4loAoQiLeGcyKhMwBquH4TKAnRzDbTJADMWPYEO5cV32A3XilL5R33Acuh
	7e//2mN+NIe25Btu9Zzb861c/8T5ORxjYF9KdM3wu8pPjphvB6o2LkcII7RGHucY5VlcIFum7Ls
	8/UeIqgKMwkzRQt7cNzpvFDXfoZ/+X8090rPZNh//FpjFZh4iRxOfhZqvIhyYtzU94v4eNB9bZ4
	caflQ1XpDeTOwXcrm2aGzoBzU8b2io5426cXUINf+IT9K078JcRDlF3W5xi+/olfZ8k4j6XcYJ7
	1gNs2Epmt+ta9gOzq+Z4fGyQG3W7LtYOfusHyY/E/ELv7iUqc8jf7lUlE47kMJoljJIP1/NKey7
	yqRem8Q5OS5xOp3E=
X-Received: by 2002:ac8:59c2:0:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52b4afc08d5mr12936671cf.28.1785486264415;
        Fri, 31 Jul 2026 01:24:24 -0700 (PDT)
X-Received: by 2002:ac8:59c2:0:b0:51c:a8e2:57a3 with SMTP id d75a77b69052e-52b4afc08d5mr12936381cf.28.1785486263923;
        Fri, 31 Jul 2026 01:24:23 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0d7csm1963043f8f.35.2026.07.31.01.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:24:22 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:24:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E
 key connector
Message-ID: <azz6axjfllmfdsxu46swm6yjxnhg6f6tpxhxjf7byryxw47vq7@wmmorb2kuerd>
References: <20260730-eliza_evk-v7-0-7ac7b66a3e6d@oss.qualcomm.com>
 <20260730-eliza_evk-v7-2-7ac7b66a3e6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-eliza_evk-v7-2-7ac7b66a3e6d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfXxhAhQJCua7+N
 fpQCmvhf9IzdpcgRVPG/87AgM1uwrU82vJ/Qb7UaaA7WE2uEQR2rviCZqu5JHQKdV4Kx8AoZf2g
 ZQK1KKKwyuaTCoaXznndxfAbDA90G7Y=
X-Authority-Analysis: v=2.4 cv=TN51jVla c=1 sm=1 tr=0 ts=6a6c5bb9 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: cevvs11_Iimc0oVshcLLWFNfTf2E1iMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1OSBTYWx0ZWRfX9HvOX2t9kGzN
 mzBWOAY9XYANgX3uOnYMZtId+DQQ6N/agIYAekn290BH8SKt7qUKOx9v96w0QoSVtrKo0zF6oCN
 xTllizV478+88ofP0BotCmT0fSxwgrCkyA6KuZyaqK8U6EXus0wSg7LtXzRceRlF8U9miVOO0gZ
 ywHuKJJv85+XSVSYVyJjc1mTiWURRfI02BM2e1DILLz15ywgyZaB6UU9YPjYTd/cNHC1e2YYRGh
 9k8POCkZg7Tyj1WghBs3vL95kqSimE2Ko9x2kngmLbrBJ/xjREKqXZcqnqElnk2NIyITY//o52q
 u3Xr9D0LkA6yBWdLnE1VKf2AwaZ1E+TY6+fdxgtiuCcK7NktaWx3cw6ozDmFTvzsy1d6QBov9Kq
 exoClcu2j5RDP50P/3IhJir+MPv2o6bm2nT5aeoLNjWXSDQWF6hYlV90yBbNZrEK85ma7m/7oaE
 DGmrUQ9BVTzMdSyZzNg==
X-Proofpoint-GUID: cevvs11_Iimc0oVshcLLWFNfTf2E1iMT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310059

On 26-07-30 17:30:17, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board features an M.2 E key connector connected to PCIe0.
> Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
> regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
> via a TCA9538 I/O expander on I2C4.
> 
> The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
> device connected over UART. Model the connector using the
> pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
> the respective interfaces.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
