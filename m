Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201005;
	b=RS7crVlIia4rIB2WPvAb8MgVGAJG5JWcmrhLPTKiLijWmRiLastVH7VQbmAeLtzpNO4l
	 XrjemoOzZPeExxU446ep6oHku/sRF/mcuZExHIvFxL/cVheCm3e8pOO9MsFjJSRwXHaHj
	 6EjDkeKxp5R4+TCYQDTsLwucmffpUf7xr3Cau+KqozDXuH16yjYKpVyuE3zmgLEiV0zme
	 a1uQVr/mabPfsHYZiFvAoqG/TR9ZJ212m5/q/DkHWAbZdIY5IsBXsyi8diAbRjkZkkjiu
	 EWtu6m1r4VRI9UTJ//CaR6hoxdBNbzlpqqD+E9F2JatgozvBuKdhyRO4ALHi7HWm23Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201005;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aBelgQ2axZ8OljStpB0V7R4f/BHUvEAk/em8hk60sGQ=;
	b=T9I/o8/nkRmdcPbi8YZxb+FOyatBcW58xWpJ3ikqxGZwLS6+Z4HSX0+y/xBiYLdoyFsS
	 /+i1oyqADgxWgf+Z+zkt7conkj+kp+tOBBmQaAvNvr5qRawffztM+1I7Drt0ZCem8f3VG
	 BUFhPTmOMkL29Va66gQxaJp5bHA1RzkExBkU5ClomGnpxlBR/lx7dvQzDKBhGhxpnGIxc
	 tZzqoc5eI/CyS6Jy9IhX0GUJrasanjyLsfHgpTkywz6CDN60ixOqKWeaY4xwrFIdChBex
	 58JQWSo+9R+d3Xiyngu6uejrCykxbw5HGehtkozbDt30R81JS59nLW1iRP238le394w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="fF5/tBhl";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPiLyP7N;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB99606A326
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fF5/tBhl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PPiLyP7N
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA0hT966241
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBelgQ2axZ8OljStpB0V7R4f
	/BHUvEAk/em8hk60sGQ=; b=fF5/tBhlYHNmknYirP1RwqLXjuiPuei/yEWbeLH0
	eifm0hzbvx5LJrR3obu2IfRCqLGwMHNNAE+BymVgagfo1WILVmKDUZiT63ByNEmC
	50hZL63FLcnqOLNY/Mi3zMC4QxBKZipvOAx1lhJJyaKWFHMvFw2RM2fD/aDmM+P2
	L25QxWJzApULEOl7i7no5d9Xa33vjO6K/pQLxxpJJnhmstd7fDYlOboAbPE3N4Ba
	kUEqIyWnXTgAPvjvxSExFlqDydWoI8RYldPSzVhpLaH1pdXcue+HkNq/2w+Dji5p
	EJ/pyPUg77DyHXX22517Wv7xEIk+4OVgLH5/Eyp8BriIKA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgj5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:23:24 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec17386b57so1012844e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201003; x=1793805803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aBelgQ2axZ8OljStpB0V7R4f/BHUvEAk/em8hk60sGQ=;
        b=PPiLyP7NpmrJn/sHc0gWj5IivUUiw2kal8eX9o0x6/viqDugMYe0Y8is01liuVCTWd
         0/866JqDG4PNMw5LdpYNtXtWXt3JLFwTqD5Hcd1auEkVoCEL77WEpy60AjGTgNZaeNit
         EE0eakdmgSdmH+BrsYcf0MKiG2JEFTZxYd8FMkBrAd+BVv/fyG9XGvXGldQQ+czieBeT
         NKZlHppwU32Q85GQi7C0EXGMAv+Qns5+z7WDEiRbF0RGDv7yKe7ho9ZqK6IxXTzbdm0i
         9II3exC8vl1NnEhNAqzbf7nQPPO9JkZqvisSFGYKnu0u0ObjORw0dnC0t7dp/9vOYSsO
         9J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201003; x=1793805803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBelgQ2axZ8OljStpB0V7R4f/BHUvEAk/em8hk60sGQ=;
        b=IZR0x7p37W/q7CeZCCOB0LgJ9vmlzubzmWjFuoFPZXGYqkpy6pKE1XH5vvs2m9svAm
         calvQitpLSZ5OBnbjh/8+VFEkdgSZgDHksqlP37Sg79xtQqgYFH74ZIovpWZiyCLilFH
         90//IuFbMu3wGlfz0nimRd/St5tkdJ6r+/g3sSfXc60IoheAHf6l+9t+t20BH3m+YKlO
         GnY3+IIW1PH+wSLX+qXUe8wk7Z1N7tOBgjODySZGVotu11J8NNdUYKuCiaX3/mI/QBQj
         v/YYA76U6qp2vadLnI38BzFYsEfCMaba/ZuLks3xQcg4Le0CTez2u+ht6aFnIHqj19fU
         IyjQ==
X-Forwarded-Encrypted: i=1; AKwUvByQrYSjy/Oqlq5qi1065DaEpFY/1EeI9u99HITPKKr6dKCsgVfru5dhYdniBMGy3odGOl829OCfwvRRYw+a@vger.kernel.org
X-Gm-Message-State: AFq9FYKxWC/x3A8QbND1dzSmVKm7D+O4WSl/Jt2Xjr1ZXv4E/C6pxV6V
	N+YGdkCI7adummnzWFBw+c8vsnjeeFihF61Vw7LB9ekvcD//UcHAQXrSf8eJTuElQTwsgv1H1k3
	0iFErzSzoas5gtBNjGxFvxJhNI5sEXn/D3NcCUtUuv7W4tvVneiNiJ6mJh65mV158emGq
X-Gm-Gg: AYBFou3IA/u+rAR7OKUVGchFRY0eO91xX44woPDxK+35juMTy28hTxq1IF8u+Qedst4
	2XATzYn8kr6SKdQ4TzsfO6k15WBGm5IFO0QDxb1ipUbN/B9QM1bJQSjDWveSrwFsi3MgicCW+4N
	122cPRquAp15BhY8nuYXpXEUFYOkCXfKUmaYkCTE6MMDY67JSLlI00dTO7aM0otzEevTpBI92ap
	xilNZx8rjCOhQ3za+tRdnjaUxONX7efqwtaitN6YsBQIGe0s0zadS545B8kfcgkuEgA7E2d0OJi
	Vs9orS2T9y0P6FC+dTssiRwjc8PAlgn8lp6IS5pIjwR8v5w3CSj+BNAGbiScdhxw2X+F/9dOUfx
	0ge6LDJ47yWNaeNGSddMiy/26I/CJv9c8RNCm3n5YVZ/JTu5NH+IWtt/E+kTpdDEpcA==
X-Received: by 2002:a05:6122:1828:b0:5ea:bea1:706c with SMTP id 71dfb90a1353d-5ec4ccc01a6mr1578222e0c.23.1793201003144;
        Wed, 28 Oct 2026 08:23:23 -0700 (PDT)
X-Received: by 2002:a05:6122:1828:b0:5ea:bea1:706c with SMTP id 71dfb90a1353d-5ec4ccc01a6mr1578158e0c.23.1793201002562;
        Wed, 28 Oct 2026 08:23:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm27389589f8f.7.2026.10.28.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:23:21 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:23:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sarannya S <sarannya.s@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/4] soc: qcom: smem: validate private item payloads
Message-ID: <5tbrgfpjpo5hqlfno4kjhmxoxksujmrwgtelw5qar6mgk342ci@mwtbajdqjfzq>
References: <20261028-port-smem-v5-0-121257d490b5@redhat.com>
 <20261028-port-smem-v5-3-121257d490b5@redhat.com>
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
In-Reply-To: <20261028-port-smem-v5-3-121257d490b5@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX3EPN7aBAOOf0
 ohr2kxuKHcco/7eNGm489R3SwEgzNWC2HSAoOjDoqFiw1HYmKKA5+d3IBK0jTGc+G/c+UYz0Mvc
 5F+iQn3CQQvII0l1dSfbUIFw6HOFJ+le23A+8zo3WhApXMpn664DLuOYGwJm3fLyfTgo/xDWi7P
 Hl3DfgGqxtXZwYYRpj0HxVWDpmP77r3wF/MDGShfMk3TSa2aqm2ysgpXcbXZ60aLD28eNvgqfOP
 5dX7L4XSjx4Ud6X7/1ED7rZE8dSgojqW+JI6KKyEM0GyiwudGUSK/WioeJPdZ75rFhZOBbbKOzc
 ImVQQk/Rh/hqiRWY8YqtDLpwi40SQRKS5yiK/piGSmiKgeQcpT5ktpf3vc+/B43LcF5ziu9TVuW
 NJkM2zciODXDPhTwCrQ1S+W9kjMRXOo8x1RlaqCPMwyMPTOyvCHDSCCpxz1H2Rv37iVuGpLUVr+
 k6fpgsx1NZWFdxhedkA==
X-Proofpoint-GUID: uVOWmU14puhIzEXUlkkCmWrD2s10-lIb
X-Proofpoint-ORIG-GUID: uVOWmU14puhIzEXUlkkCmWrD2s10-lIb
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2136c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=mk29NWWDdjAKazUUNzEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX1Q05qo3H7HOZ
 xz+4OvRojG30/28vf+js7tznfaQ/tm1EfB0BahKtJXNBNDf3HaL3dBAyOKzke9JAaGbqCbPR8ya
 SScJ0wLFQf9jLAMJEpSQq/lT9vRVEss=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 10:33:50, Albert Esteve wrote:
> From: Sarannya S <sarannya.s@oss.qualcomm.com>
> 
> Validate a matching entry's size and padding even when the caller does
> not request the length, and check that the payload stays inside the
> same region as the header.
> 
> Zero-length payloads are now rejected as invalid.
> 
> Signed-off-by: Sarannya S <sarannya.s@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <sudeep.patil@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
