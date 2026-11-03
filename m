Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697179;
	b=HZGSTufMwW9sNdHkslVPcLdZZbHhrRFuvLMbLJIZr4dMXUxG1CCMQUxmpC8VOG4+2kWq
	 9msgRZHiPC2QUcnR7oHBEwfrOmaP+4NRZ+st9BazGshrJD9jKfjB62E2O83MsF2qVLCRp
	 PqUtN8hVPT9GhOOB9SgbFQT0n8Vam5PfCLH7qHLL2wlfdNhYLTFuTtN0EMliO148Bj4fS
	 akZA1MfHiEXX0Ha51HE4D75USgTw7LC0Atcn92LpnbuOnuV4lGqvIU8NDDX5gGlLiBNfA
	 ec9S1VazZPS0ldHovcJ8Wm8pks0+yfafVIGfOM0bgYD6025JVpEosmafQRTjRe23gtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9oFOp0yBXC4uh77wsDuOcoqxLQK5iMsPJrZNKlEEsr8=;
	b=5r/kPFQjMBGELbsqoUXXQ+ZvKZvY/xFFbBoUfgeCm5Ng9JhRAKrbSFWWiVFcVBCK/y+X
	 djUkKaZBAtCyB0LxKy93dXEa4PWHTJDPpE2oo2r0r49ia+UjgTsv7tmYTtoW2DJ8W/dyR
	 l97TcBj+d32ozVSXtAbYdLmZvbonTqMyLWqCY0JgwpDujPQnULa56Zl5Sl8TE/3fgeL/L
	 EeqcJYcTWzdUtSCsGzJjW0DL6j2cBV7aeRtKq9ufXs62s5yqvInx0pzbpIP+joY7cKio7
	 8cl7LZpg3H2kvusALAn0pyOEk2KIGRGI5qlVidMJ2Ot4N5MXCAFKMsXBVa/YB6AdDZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCz8XUD4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P95CNyOB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917F606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4917F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCz8XUD4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P95CNyOB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A38P38J2106680
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9oFOp0yBXC4uh77wsDuOcoqx
	LQK5iMsPJrZNKlEEsr8=; b=DCz8XUD40mdjSL1obAHtWV6sDJkw2cAjiH7qMdOc
	fE+CHwwc7C0fM3V5/YrN22mx0LNY+OUbJdY0LK0yEtWlzoP6x8Cmgwks37HlDiPu
	HGWt3m2pYVn9I2Blx2CNv6BXe33USiTDhZl3JGmgXWpWYLoV/rzBB8yi/xnvevZy
	8AzcAq2ffmTT+hVqt3ChhJ5MFOi/G/JI0XaUNddvoaABzW6DgFYE6yvkoCDkdRCs
	kQKQIvCmAQAstP/TsGD2BzCvT1hhukKFxBAmp4vPjQtmtReTO1LV9BcDQsT8nfHS
	LLxqWAVUZ307ioCe6ozrg7Jys/I+tkLMTYJH2ugdN5TN/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m99exv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:12:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-945b0154705so361156585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793697178; x=1794301978; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9oFOp0yBXC4uh77wsDuOcoqxLQK5iMsPJrZNKlEEsr8=;
        b=P95CNyOBj9MQ9wzuPhrHO5floZZiKhdlnYX/cqiaNtE2iyuNIal1i2xLQ60SJg2YY/
         zBwqd4LA2sRfQBDo56QFIqhey5iRFrxPPoMCSJC7AL+5WEOl/C+lExgTvKs9z7RTR8GG
         42j7AZBBDl8ZQo6Hi0WJCIOBWLD0rGjywiGPvcp0bSkJoqppGaqt1tSftzmozvzh6Vx3
         agjwibh+CU29t4KD4tE+/GYo3VdARO4l/DRstB9l9CoEPDLLd+ZmxiNoenb1ZiojWwG5
         OoBc2BerTrgbg/2dcqvk7nEBYDs/ucDNpeaHJfnv7IE04peJID22QgGTehoHz6iOxwC4
         OloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697178; x=1794301978;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oFOp0yBXC4uh77wsDuOcoqxLQK5iMsPJrZNKlEEsr8=;
        b=nDji/Rf0uTGL/rnaiZq/XseJYy6qqTcNB4Ie5fzFLM/5T1qIgyP90P7E0/SVvOSvRv
         WWrEzd6GoBoNPjPPSQcD3Yl0xG2CH8rWNWRe3BuQFmucBvW5pVjsHaMR+IcMB9TtxPZt
         Rjgz6SCg/1JNZDXeJKsvFrTvP8FhObCpRUIO5gQR8PVtXPhowrTCklRVrCjKlE0lDVE1
         HQo9+TRXKYS6EPQrVFoRV4lU57fwTZtHCjdXNmL4kDfoYVbkikL2DS5bK+I+hfmW2sh1
         ZCO0nZNetWnxkX+Tg/Yz5lLW9sK6RiTCf3f3xpfAv3QOwafmqIQxxIypi2Q4cKXy2goD
         rdCg==
X-Forwarded-Encrypted: i=1; AKwUvBwttfd9TQlv6CZWOOPt0VoX2MY9f9RIFdD4irxUyo5kNyuORdb/RHsHZc2zbe08j30fpU8rdK+zqCzy4+85@vger.kernel.org
X-Gm-Message-State: APuU4Z9G2tiHBlEbD+LLGU8oPDPpe3NbkRLO+k4m9rJNZZJj10wjveyS
	Xv+S6LQTvQ8QnEzwB/9x/mMKb73Xua8dN4ENkfp3UWM6IfUiLm63atkhziZZ5wnE22f7qIt7cG7
	fVHwG76Tm6GjE9mE8C9P+QDH1+zuepYKRfYKnsV69LU2t339mwPhc2jLbTnHxpNogrIv4
X-Gm-Gg: AYBFou3T27zTYygE1ef0V0OhIan0IdW048hGmVs0+wQD+Q12ZpnDP3HG6Y9lN+lnrvH
	wt+6FgyOlSBVRTuIZiFIz73qY9Kb7IXi2faSQ2qwXGkqZEJH+rSqhiRD9R2+tVNGKJAqwoVkwQ1
	FsDzV+Ia+xB7VtzISSHyFIvdW//A4H5yet7NQCjXLjLQp02trjEwcITLhSfBUjO2X9m+v1gIPMb
	m6lYFagD8q+eUpbzl/E1NUmk5wPj0hKciOho33FkQjW94NbFil4H6lzytYRlW4a9TwW/SAc8l4+
	iO6GEzeC//30lGoS8gaPN6RvKYQNVy1hECy1hO9QOW6qoEuuVKQhO9CVjb4cKdsojr5DtwrrJlZ
	OW+Dufh9cB7dZqbgQDsOm5IbS4Z1R5HKejKvqXix8qFSEWJCfvUjC0u4bEETApto=
X-Received: by 2002:a05:620a:838b:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-944217c8512mr1958705285a.63.1793697177429;
        Tue, 03 Nov 2026 01:12:57 -0800 (PST)
X-Received: by 2002:a05:620a:838b:b0:93b:d7a0:d9e5 with SMTP id af79cd13be357-944217c8512mr1958702485a.63.1793697176814;
        Tue, 03 Nov 2026 01:12:56 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm215839755e9.0.2026.11.03.01.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:12:56 -0800 (PST)
Date: Tue, 3 Nov 2026 11:12:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Raj Aryan <raryan@qti.qualcomm.com>
Subject: Re: [PATCH v2 1/2] soc: qcom: pmic_glink: Add RTC client support
Message-ID: <ko2v7vgyzqx2lj44syzky6fnyubhlhaimbeyvko2exujtpriv7@gv2m5xtjxlgh>
References: <20261103-rtc-glink-cleanup-v2-0-895eb6e8d890@qti.qualcomm.com>
 <20261103-rtc-glink-cleanup-v2-1-895eb6e8d890@qti.qualcomm.com>
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
In-Reply-To: <20261103-rtc-glink-cleanup-v2-1-895eb6e8d890@qti.qualcomm.com>
X-Proofpoint-GUID: 2SzwoC6hfPrjaoy7ikVBYKiwIcEDkzMy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNiBTYWx0ZWRfXxqy9apJ/a9sA
 CNin/CTsRqzPYwmQG8w5b6bLVCcYUyu5ZDCNnUjES05PRwivA1Ip2N2qelxk2J/5wIw+Kw4i9aq
 oSN5XZArmMjTBHa82DzgrV01vYBDzb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNiBTYWx0ZWRfX5fLHTpGC6iix
 kPjmqI5RgpV+g+6migG3Tq1NkhGUd4FagfVsEv/wn9Lc9k18S1+1YR+4sm99d4oZs7rB51X3iva
 X47KrzYptcxAUqWM7b05G/eG0SN2lLQFesCvWLBqf7YfJBDp22G30vM6vUf0+91MZKbGVVTPQDg
 7pxJlMmSh5BvciooNhkbSmIICvPlukFEe56gaWLdK7+zrruifprXvxvvtp+phOnT48T/wGUsbR5
 CU8b6XtmxvgksreA994uQJozM5RJH8h6qdtPd69pdNV9z6DM89OXfGq1EKJ/LknGVdqL/H/RrCj
 j9/NQoARNstI95V2R+R6MGQucZZMjkk6jEBWE35KpJY6eT+gehVjZ4VSOYFlA/JSo7ZsNiFFYqi
 ryiDtW1dN8gQ6Rw5PiZ9vomPuiS/gQU+d9Lx3u5AxuiSOjyMdwbH7GFqBtaJTsvLhk5++5Jwczh
 WoNmzg2ec+UBirK6F9A==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9a59a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=fuBDp3P7rzG2D-Ll8goA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2SzwoC6hfPrjaoy7ikVBYKiwIcEDkzMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030036

On 26-11-03 04:12:17, Kamal Wadhwa wrote:
> On some Qualcomm targets like Hamoa and Glymur, PMIC RTC is only reachable over
> the GLINK interface, so add a new RTC auxiliary device ("rtc-glink") to let the
> new RTC glink driver bind against it, mirroring the existing
> altmode/UCSI/power-supply clients.
> 
> Also add pmic_glink_client_unregister() so the RTC aux client can detach from the
> clients list before unregistering the RTC in order to avoid use-after-free issue
> in a scenario when an alarm IRQ is received during teardown.
> 
> Enable the RTC client on Glymur and Hamoa/X1E80100 variants, as only those
> currently support this RTC client from the firmware side.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Raj Aryan <raryan@qti.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
