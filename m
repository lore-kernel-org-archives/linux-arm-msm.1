Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794930740;
	b=biJIrSEof622+/ij5g6o2rMHDHZxPgLF8AdG+k0gY9r4SoNirrq098hPllzoYFBxNHuY
	 9snDxmwzkARw2kveaecNY6aAAZmyJHglRx+qu8Uf5sAD9fj63F61WNZ4BIwoIOzkUAX3J
	 XPqUOkxSHWycVbfNefnMzBkzRlNa3gcjr/kgF+edFNZckjQKL2EVybz26IT9DgX9REwXM
	 MkT4XwEuTadvc2YIIX/1f6mINGz9oUwMG7nbqYdx9g7XafUz/4Hl0VgtKENaMTOHRTSaG
	 0kwqz1kE41KiT41TIaJxftt9GlbNCkE9tacoUiQvS7Z+N04dRUIOrH9V+Fwqj+aPRCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794930740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
	b=PAvqMvt7AADJTvWhu02wZ1gI7U6YI5HoSwQijCWNVPeTO/SM4KJGGJ1SYDGJeIA+EuOx
	 /3PR47yu38EU5OpwTgy4jnmDkRIYnTw1z6wlRP1NWitU1qlBlFXsVVKtl+o7EBuml2eF8
	 4+GPnb9TrzN5IjeyTtSu23MahC+Nx8SLFVyKK8xm572r9pXfsbkkssRXzKlI6Ls7QCqZq
	 ry5gYd3vu+RNxMBK7wFubldrIXtJl8LPePjUZUVTUFSt0a2tPcBnJhe0jHGQif09sO9Af
	 b/Gds9IY5DlUbz2E3oxSrK8XG/BkjikbpirWrkTG1szIiEfkAO6PE19X0CqCy/pA/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ff2/wjmY";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3116606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3116606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LCJy97CK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ff2/wjmY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHFR1jk3503849
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FmGrMIbX3U/GmFll4bp4B4R9
	IonCrAbCABRwgK+nqKg=; b=LCJy97CKcfTS8s7rGAMfk7tN762TIevSlxFaIfrK
	0kSHf/kxSmhdDdZZTSArEA6HsJDigvKdLDhk/QhLwLeoPy+yvUh36qCdQR1QV4o/
	p/sWxIrR9Pi6Mp6gFsuHwe9u25AxRpRrlAhFA5y4H7nBZnGAPKmd0k+aqirvSAjH
	MYEgQU1V7HEBByT+6agp84N1MVrRXssFbtwW/SF0GwFJcQvF8g32N52ZGwb5uEkQ
	K/MnfrFuhJ4Ydm2lFbZU1UIoMn4rNva3BX5EzYqYmGKsIIWlkW+tHf0DxpSr+MsU
	WPc5t8Oqyn2WjO2YAZ1QPBlkhNrkGrw8ouWpYlLXigb8Fg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0mv11dvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 15:52:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae72da2f57so7681360a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794930738; x=1795535538; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=Ff2/wjmY7nbtXRCYKKjVD+UReHwpw5C/ZDgnqbX60guWJgvZf+fOKaSZRiJS2NIpXm
         Sff0sKMrrqnzX3rUkS2pzlLQF6MZM1Hqg5B3NmXgaJUMrdk+KNj/lV77uk0oYktxpua7
         yeTSvtLOkI8RzIdN+zSZoY3uctv2pU4OwZH1wmkGb6XSojrpF9WI38K1h+5zwID7UDu/
         NIHX1H6DZKCoLzQ7WvVdnJ17diNc1F4P7fxzhFfMt6NSms+uqOYOwLIDTomMuDlmQ9kQ
         MH0IjLhtAKNVyxQT/d3YBBwLGVqr6/tl/mZpPVbB3iYpHA5S0bwdiX3hKGKbQHvR+JuV
         O7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794930738; x=1795535538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmGrMIbX3U/GmFll4bp4B4R9IonCrAbCABRwgK+nqKg=;
        b=U48DUEE9RhZwLOqhdlrIXsSCeMIMhqrPrfhhm+vnd9os065p2WfkcU7sNr4MiwDNTD
         OWfXtScnqmXOsXYcv5+VRC0DqAhetXFuIcADIVBv5MJ1nBWgwpr6C8ipooVGu8TfnaRR
         z9FWpecONyp/v3lUGE5GP6jinUANgTdgCsLxqs60yiCSFV3Rp4uIkK07cS2I6SGj+E/q
         dnkj/dmE/ALJGPg4SADle86hCh5w2G1xxbYa+dns5HsOT/sEnkkfGp9jHrw37wncV2tg
         Z2TO2dKDICbvJK6m9rAt5YzHHmK8NA1zqK23DVz7OZAtoW+RWcOeW/vjmo3HyllV6UvM
         axTA==
X-Forwarded-Encrypted: i=1; AL+hErHSrn+JbbeHxIeWuQ3CT/THuNbKHlKO5juFXWHM59jHtlUprX1Vj128Ic84vRehABEkYKyU/jM4Q/LY+OGX@vger.kernel.org
X-Gm-Message-State: APuU4Z/ru2HaEgbxSFCqimj0rcQ5rYRdc/Cnp/g7y7SED1Fo8wOL1Z5g
	NP0KHWAmm6AjRESfCs9mLvXkA2/2tfsia3StoKuD5CC/baWjn4XCAtFNfEewSyjJZ6DDwX+EzNI
	OsfAQZjDsquwFA2n5jouDYtekDisuY10XxTF6VSkS/gPrN2GLatO11v0G2JI2B18ACWyN
X-Gm-Gg: AZFdTZfLNSdQ5Tz5O+WEsUZuQ1qOoLsyMoKvU+vlKkv5mBaXKPUAHj9PMnGn9hScMxx
	rsIG/WEI3TIe0DzNMzXHWG92XIpaiQkuuNlJcisPqMnxG1qVmznRiQNF8mm/51aRR1+/ek3ebpP
	5zS6RTLLtYLb+k06atBDx2gwWTFAHMrJL5O2Th0E2/wpZ4inQuC+gmc94eTCUTrm+pTk96NGOut
	JazbwSHscLMNRR/JHEFZFvuK+CSzVELm/76Yyc1w/FY+M0dUUfjhRbQp52SbSe+loR2yixyM4IE
	VYgdNBTD3+0ttg6BMf6islbzHlLSVwvSKpohXQ9s/3HXPh6K9intGBOY0hhgoBjQHA9kIFYwP+R
	bpXC1HN/PT3T5wrDzJnJC02A2fVSZ10aK8So1XCCrcK3YHqvUPLKFiRd0zOEbQRfikF1PFzFMXW
	GJ
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710848a91.34.1794930738206;
        Tue, 17 Nov 2026 07:52:18 -0800 (PST)
X-Received: by 2002:a17:90b:5343:b0:3b3:cae0:2b6c with SMTP id 98e67ed59e1d1-3b3cae02e34mr710809a91.34.1794930737651;
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac292c53sm4601441a91.7.2026.11.17.07.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:52:17 -0800 (PST)
Date: Tue, 17 Nov 2026 21:22:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: remoteproc: Move iommus constraint
 to SoC-specific bindings
Message-ID: <20261117155208.wbnm2hldjrfomryh@hu-mojha-hyd.qualcomm.com>
References: <20261113-shikra-el2-v5-0-8aca743de97f@oss.qualcomm.com>
 <20261113-shikra-el2-v5-1-8aca743de97f@oss.qualcomm.com>
 <20261116-boisterous-ancient-macaw-8cc00e@quoll>
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
In-Reply-To: <20261116-boisterous-ancient-macaw-8cc00e@quoll>
X-Proofpoint-GUID: CyQFtvEbhSHATPrr_C3YjtC1NnsSdqjy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX8twFqm24qTZh
 NgLLbANFbFVx3sA7XfucE651kSDgtSyqVwup2WXHH7s9VqzkVolcc/c8Fs1dor2vRQE0kiZ6APb
 1RcwnzuP2h/wZ4cZfT4VuZUeu3/e3Js=
X-Proofpoint-ORIG-GUID: CyQFtvEbhSHATPrr_C3YjtC1NnsSdqjy
X-Authority-Analysis: v=2.4 cv=Cuwq4X4D c=1 sm=1 tr=0 ts=6afc7832 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=mipXywydoeeVaK3_k7YA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA2MyBTYWx0ZWRfX6LoGqT7fnVbz
 fyx9CeBhNHzvSzdYuuOBd8ulctPldoqiiTcSzT0OAv8NmQGZWxtQg5Unj2arJgtLGL8aamsMfbe
 rCcdylkGRxzqjoE9lsvAcP/w1HGNs8gMA5l3MsHhcCAGu57ffggh5NCx1WbgHlRL1napb4Rvnr8
 vBrRy4CU8C3J5u1tE5tkUnKSvR0rs4wLjytgarxlbPjPTWoKu9tPXra1lXIYJP6TpCJU8qWzp5x
 COprh+4b0ztRp0ypH+TmmVsleZYgJSAUngYMk2y0ozb3sd9KMBbZMLXjjLePnsVVmMQlr9CHDqW
 t165o9nkVAV2oHY2xDOc18w0mfFIvyhODyv4kMj8tJpzzDBkx+5mQlKJyzMB9Or9TWXXV4XrtMf
 eSJr0hR6FXJgXcSJpR+muLI8spgbb74iVkYef31sZ4j4/yj9eATPKhtJ45GJu/V1kSXOUZDggjU
 xQ9tdTwyVz1rxGEx9Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170063

On Mon, Nov 16, 2026 at 11:58:20AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 13, 2026 at 08:02:20PM +0530, Komal Bajaj wrote:
> > qcom,pas-common.yaml limits iommus to a single entry for every PAS
> > remoteproc, which is too restrictive for SoCs whose firmware uses
> > multiple IOMMU streams.
> > 
> > Drop iommus from common binding and let each SoC-specific binding declare
> > it with its own limits. These bindings set unevaluatedProperties: false,
> > so a compatible that does not declare iommus rejects it. Declare it for
> 
> I do not understand this sentence. Compatible cannot declare iommus, but
> anyway the bindings do not reject it.

@Komal,

Yeah, this patch should prepare for the 2nd patch, so ideally this should
be a no functional change patch. Any constraints change should be a
separate change. So, ideally, this should be removing from the common PAS
and adding it to every SoC PAS YAML that inherits qcom,pas-common.yaml.


-Mukesh

-- 
-Mukesh Ojha
