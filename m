Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401449;
	b=NSGby/4Il5KL8um2mOuWwkhcAFPpd0b7Sjj6C8hMB6WuQHQ5cSW4BJyVFY8bxmtqWp98
	 D8jPM43v6/umqJzZqI7/6zsyfO0KczoTyGyKLL6vOrDswf6MVdVif6qBtlb3fYp10jFlT
	 OzJmTutMnDF287F5XQ7RoZJ6rFAtCSldvrEihnZIurgPkNnADa81dMggqxpiIv57oy7sB
	 JLPJ4IPnJBmiaaRrEz4I6F0yc5+apAqznxuhR/iSNT9q1XmE6DQjlD/7tHqh06UUuuwFL
	 Lxi6pT+Fa9r88Q4UsvArORwotLvRPHTPLuRH0unAkFwm749b5qG0fpOB1+7qvGllDeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4FAs0nc2V9j03oi2Af+IjyvFXtGq65JBcvLZ3pfXJ5Y=;
	b=1Lj58eugsPMNfOfEyFIyDh4FRQfziWYnd+nbyEQ2FEzVGxsA3jidRTJUUDmYcr5iCDiM
	 PQCQ7fctv+TGRh/EByJfy6fR0IC7sDH6QVajmV0yRJgIB3zvFxzJI6/8BVSIXc1CpZqDe
	 7lNeCKJWDYCrSmMK9B08LeeXUvjEo+WjPtEqzfJ0H/1xS0F4AJRPHgXhTShJMdKVN7sI0
	 4lnje3vapBs6oIAoepkbZzDMwiKMoabGUNKZs9TzEjGGPtb7dCi4Mi2uGQjiEuYt3F+Nc
	 jqGUW4MQB9YYLG0mhZXd1yQsCvcMT0BfghU9RRikg+s+z1KV/HUerXFsRrNCeECMIeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="jAut/Nxf";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SuB3ZFQn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28390606A33B
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28390606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jAut/Nxf;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SuB3ZFQn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZC9k2975432
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4FAs0nc2V9j03oi2Af+IjyvF
	XtGq65JBcvLZ3pfXJ5Y=; b=jAut/NxfJeA/8ljpv9kMZOwZo/gqKe1bCZwWZdq3
	6jTwbxeis7BbslY0uehxTMJaGi1ElOKX+bIWTf3U+aXRoADWuQWGXPTDINEiQJ0N
	fkHQxvDzleaHm8iWWip5FGXVIMvQTAB59aJ/oDQG1GJgrxcUcqNc7B5kwgOysE5i
	5DaGrpN1akMzPd16hD4eBe2lnlt8Uc83EZKGe6RDjbMgGqq8pBlu98MDmrYxRD1/
	opybjgaDwB5ZT8NwXYl5wJ8mNh+km+SpWJZ0ZznxyfsVqkzKwjJzs19RllA1ZGoe
	diAB9Xh0QeBInrpS9qR6yNsxr53DZd1NUs72FPbqgNXRug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbu97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 12:50:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-948d83322f6so66042285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794401447; x=1795006247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FAs0nc2V9j03oi2Af+IjyvFXtGq65JBcvLZ3pfXJ5Y=;
        b=SuB3ZFQni2vV+mQQRavdn3iHkRo9Ey0R08jrs0k2yoDlqq6nj7COL6W+X+CAG8hmbP
         9WcvcR7Ov1SGa8qP6GevFEI5jzD5uTuGWsgjCZ5lYnx2pnIrvSr+E38cuzxJcFxhFZj/
         tG+zh/7Fsdx1d+kMyIGQ7kNJqJSYUIRFeJK+AyfjpIK4kAxMOOBNEHkFzGT39pf3LS2P
         /YfIT7jvgqJCOv+djEcRyOW48RliwovuCRk7Eu96XHYnFGdkjJQspc2dIbQ2Sm/jWkwt
         LRgq2j97lE++05kuwMGXGp1nypJNcXOrtExdzcQUcBAVBCJIydS/DCb5Ye2dBDcmL6Dv
         Vldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401447; x=1795006247;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FAs0nc2V9j03oi2Af+IjyvFXtGq65JBcvLZ3pfXJ5Y=;
        b=AOGgjFp0pjX5zw20GWOfPKeEh9MOMaL5/jO9QTLi+6LMIJgOEHVPA2nKXie/NMgClK
         BH0em+4RwExx+jeUnwTBurhEwOnvOE15k+HYaQJP0H52fVZ1zvYEY3qbhMGwZCkZ2cng
         9qlrwJKq2TMYhwfZcdT3R22x28sl04bdDiyFzVAzO+dhYL+2G1/et6uwmzpNsNPAj/P7
         xnM8gXJifYjBOqag0HZTUuUV22Kkaq1Ed4aEYt50IDTRi5AqPOI6d5mpBmLXjeexEow3
         K8jRVYrfvth0PSzG3nujHShdkwJmvN1Sl/Ii8IBmqea0K/TSwWB1jX6znOuTxkkrX/Hi
         dy2Q==
X-Forwarded-Encrypted: i=1; AL+hErFtFWf1rMAgUf7xzeMscI8Bsz0Sto5TQGsi0/3/l7VJonz0xnSRafha0uYbOaWPHuz9ZEACaSlbQKLZ2bkD@vger.kernel.org
X-Gm-Message-State: APuU4Z/9qfy0lfgSPhZ4gV7VU/FAIjeLNS9f8uF+CDukAib5KdpXqeuv
	oYKqsg3XpmWkB48aSnSsq9NgirMGCvQrsYU2L0DII+3R6Xq0ZYly+EGWAfqZYaunvHkK0gYNNbN
	/Gc9BxdnC/yIlbYJrS5r+pZ3/jEI/zSalmCjjUHpgKZhzzlZPlcUWVicUbVkIqcdv8rId
X-Gm-Gg: AYBFou3xFnjLaZMC8dEjMvrLJ/0Jw03rZmrAnhTcSAA++ANe3+XhIVWKuH22Fa4iqKk
	TPXTDCbAPSs8sD+MWkpBq6ZC27SrIChkrN1QvOZrYmpspIm8BNdknysFnx+/nu8F9Fv7hAQhgah
	/eWQ5Pwsp7wbPVKUfsrN8mwIx/0JgbWbfxH6GnmWWl4iWaKakNYWJkAziXsQBpE0R04iemZdqV7
	mjkNak9RAwUI/MF7BM+J9dZADuh1Mg03Z25NyouQQ8Z4mDkOBDtTL4ALqgY/mf05C813VG+Aj4F
	fgpojImJhiqaB1JeHXTt+HUv4u3EN8i6r6G4e1CbVdA/erXKPN5z0VG8dg6VYA4+t8MMwpgYA3X
	bwdkgLhDv+Z176PJXrP3/RgrYsGYskI2kGZnfnDSSQmyAItab1ri8gKVGJWIWqBQkhbhYKsOJ+f
	JIV4ME94U7TlwHDU9MQhvDTVq7VUwiYUzjWxTRHaaIt8aI9Avi50gs1ZPdyOUZGg==
X-Received: by 2002:a05:620a:a195:20b0:947:b201:fad6 with SMTP id af79cd13be357-947b2022f47mr193461485a.68.1794401447258;
        Wed, 11 Nov 2026 04:50:47 -0800 (PST)
X-Received: by 2002:a05:620a:a195:20b0:947:b201:fad6 with SMTP id af79cd13be357-947b2022f47mr193458785a.68.1794401446584;
        Wed, 11 Nov 2026 04:50:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c162d0ee5bsm695e87.66.2026.11.11.04.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:50:45 -0800 (PST)
Date: Wed, 11 Nov 2026 14:50:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: c630: Enable DisplayPort alt mode
Message-ID: <55cyvfifrnu6jz7otkyrilxged42tbz37oc44hfozuxvpj2lsv@f5lu4agop3bl>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-12-ardb+git@google.com>
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
In-Reply-To: <20261111115303.3749380-12-ardb+git@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX+u10FI5W5r/z
 NWyPRKniD+P4678NjuLN4ZIPbpx6Q1meBKHygWlvHMyCVbPV/f68tO7jJPVUA8JIz6/WrHEen7r
 STi3ACppOZzexNV4SOAMtvc0VV3S4VUIJWYYTiWKQ1qWqCpgMCnCxDS6wBtqCtMWDNyTlQnNT1D
 bJKs3EavcJBjuyb7FXeBfxuSbpQVyixsVbZ0JTpEhmTkEMkArGPbz2shK6HhntRn3e1EHQ/mYy2
 DR29A24iSbHxHFOn1hTzyhXpMZ/9bv1zMVtylBS4LLtp7zC3eFEA9oGHZI6/5yXeg9EApeHXCQF
 +00LaZdGF1mZGmncuBXY57fJ/jX0b0ElwoIjcatDtZdpnD62nUpntEawisKb7/rsBVn1ONUu1El
 nOOrTI5NTDgaH6bVMOOj7ZiDoEJ/YRhBLKq1InlnKtWnqlaswLrlnPMcFtzbR69UD/xp+nXw/AS
 kv0X0gXd6p6areO72Sg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af464a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0S6IfGOmg5uo7OBnLw4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 1mynb6jf6ZAZZweloBBFOktbOmNoedH6
X-Proofpoint-ORIG-GUID: 1mynb6jf6ZAZZweloBBFOktbOmNoedH6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX6SjjipunfzVE
 ZLHDMEx7w9TVs7o40xDsYtYmbRkbaM4LtskImm/c590+KIlO+gQbmuQqP9yPmAk/p0h5Mg9gcPJ
 WhpM3fNtRiKyLl8d7cZRLZqNoNcSzGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Wed, Nov 11, 2026 at 12:53:07PM +0100, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The right-hand USB-C port supports DisplayPort alt mode. The EC takes care
> of entering it, and ucsi_yoga_c630 already sets the orientation of the
> combo PHY and passes the EC's DP hotplug events down the bridge chain. All
> that is missing is the DisplayPort controller, which sdm845.dtsi already
> connects to the combo PHY.
> 
> Limit it to two lanes. That is what the PHY provides alongside USB3 in its
> default mode, and it matches pin assignment D, which the EC picked with
> the monitor I tested. Four lanes would need the PHY to be switched to its
> DP only mode, which nothing does on this platform.
> 
> Tested with a USB-C monitor: 1920x1200@60 over two lanes at HBR2, with the
> monitor's USB3 hub working at the same time.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
