Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868775;
	b=xnfpVTwf1DIoGBjxs0QoAp4ae8x54ekzMZqZmEyaGQIMEj1/sp4DPYc9wjjiwjlaa4il
	 vu9DfhiS5aVZauG7X8qtFDRcgVRA4IufFYJV4RZTBn+VikY8TRhQfb2eNUkA9tO5xVF5V
	 o8u9WfIfYlaf+z7Pkn8m9+/NTCoc+hkQA6AyIIw2uJ1fQunaPIaT7g2IjkyXlKdFyKeDu
	 MPTLw/gFGcd5Z9R6lCxSd9T5XOSWei59leiulQaTn3wfbz8GKxeBfH3xDPmXD5Tgfzzgp
	 sIqc1KzzLnSn5gHYI+heWQsOmA8cOv7n26VChVjDG/1CdKzItGV2W7dxAEnHZUZQcVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4K4DKH1Ri7tzBJ4HHfUyDBR0jYCz2IDl/JvyzqdqgnQ=;
	b=Y7xW/m2YAr3ewdL3Gce9ON9EBbfmYUJbEpz6jcRB0cTLugfflFykz49ObnrhYd7JHk5G
	 ySgcjPHfAzt+9qh/D2VC28Gnk1RcuTiDsZSRCsxERtnL95/7y7P4ffb11PpJqM4HTAFOK
	 vV1r/xVXg3R4l4KAQtaXqSJXwEDz/Tth7aqZNUt47sekkCYfWg5i5hHkOS+YbFGO0o0BH
	 wY4cHZcS7/oxjF/cO2Eq+YobkZjzAf1vCbJJXh9pIWhZgGXc2lgC3Mk2syqE3A1k1kOjD
	 CMAqRkNG50B5nRj86pAsCJ6LXzCkI+f8nWLCfu4jITeQuS/mEcRGVfjTKAyqC85+VXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdFaqPeB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWHmH2U6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1594606A329
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1594606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PdFaqPeB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FWHmH2U6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCTN942023
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:52:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4K4DKH1Ri7tzBJ4HHfUyDBR0
	jYCz2IDl/JvyzqdqgnQ=; b=PdFaqPeBQ/N+GRf9Zcxpg1cvwbKwhfgNdlkFhD2W
	fTyVT4iWQ3gNK/mGWti1vgNcpKI4koWveZLqGF9FMSlalXXuEkrka634lc5H2Xj1
	LVcezoP6bqSiz0nZBFGTMV+BrunEWG2OEAmE8RVDaISQM76HuwF89M+QGngx9Oq+
	XRVo2s3BbX4aBBAuQOvy3RNA5ZzVN3nync4/bXDxXQ3r6kjuGAOu86kY5zvOLMf5
	QeEVAaI7wl0wsrxCkkg3UuNA/DocF8si4l0Eqbk1ULTDXQLq5XRZoAzDWDugaIoZ
	tJbiZZ2DNRiw6/94DgEkf6eGS6whvFJSW8feIWLDMFsQpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj43gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:52:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so313571585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868773; x=1794473573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4K4DKH1Ri7tzBJ4HHfUyDBR0jYCz2IDl/JvyzqdqgnQ=;
        b=FWHmH2U61EFNm2RTA5R32Y9UGGpOHo2RyYgD5mOhxeuvc7KcrhIxim9LExFXCZ4qij
         jn7vzMZvgdjQKJXoiOFIOlJLY6Z+ETv6YO5OJJ4/7MdLJPwFz/AvI3XnPmdqYp1b4phk
         sZKVOL8DAFJ/YqfhfIIFQWH8X7LL2wUMZIjleGV/AxMF6Cjihd1ji0cRw7YPDJWg4O6O
         1P2ZelJS69LUbmwwnO7gVYess78j3Pq/2gWfgVYzCM9gi6KxucleQwb3wccjiNMhXNZJ
         YmD0hRKz1NiWESKwkP5LUHczBsbCLX5X+PwvRRyZEL/D7JheakepYi3rgg29sNojB+8P
         kNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868773; x=1794473573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4K4DKH1Ri7tzBJ4HHfUyDBR0jYCz2IDl/JvyzqdqgnQ=;
        b=kjBdhmAIhYMXHyqQIghGFKpGiF95cg4tcm7CvnygkwUxDoNqS3BQr/QfQbJG8wHx5K
         q31cH9YZOy+BjQG5cJyilwX5M/EjHcVAMmalrnmTDDcbLf8rTzLHj7ART/aiKjvAkIlO
         xas3XKQexqFvhVVALOe39k9HoRGggzqUq+EtYvIbnXjvEmaPaKO3NqTBNEuyPvNKAKq3
         csI6pK+v82bqIsFtBjNFIUgQpldzrdELMy5ikGFoMufOEhLojdjL/zvbTF84jlOJrwEa
         ZZB4s9RhXpnSdid7RSVZDcuBbSkaRq2L5sw5Zpzy72LPL9Fqbv92vcJSS4/9kSKVIf6w
         Dcqg==
X-Forwarded-Encrypted: i=1; AKwUvByrbYLRa+8iRsZOltYAMcJxb1x6Va5YNQpmRs1W0cxz221Rr/MvfzX8/vHKQ92sFS33jiMydr5Ib5UJR0sI@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kh4UoGDgsOGX79lARc1nDLqMTTkoumMVRrpTNzR1bApt/xC2T
	S+cSb8uY5aSsSXNmwn76sD1mrbWdre4DyMs9eq06wbPZPydDfHsI3sGxl+HCoUEneTB4a26i+4o
	6b3MRwN59q2dSkzXxoZYH4GbmQyPuGvPk6gFI8auxPQvj16oBmncj+3Xrb1JyBU9p4cpU
X-Gm-Gg: AYBFou0mJtoSmAYnM2YeP9B+le1+w+BWxbFVkuPDMfSpcM2vs3I6WCLBRgOFFqcmHfB
	5W6w7GaQUhxtGkldTwkK6/xdkD5m1twTxX2FZf9C/9Pw4ioQ6OkXO9bDg0fPh75S1sJhGoilFQd
	QjqzwjjMn1IVZIkWhR5J6XcEy/Y5uUzV98kKSkpZNSJpWefugBKoqWWnTni2Tu53UJOjJJcIRhT
	SLylU2aGO3F5HRYKXd4ThdCmaxBOy+g1gVp6NEWp+fy4CEydjhqqVben9ExRs0UqRh5fQPQaT7p
	otFB8HTamRFOrYm/1///c3Iy2HcJdASoJIW8KJi/tSbOhSFDspGkbfMJdwoSq1kxP61vLt99jxQ
	7UcfRzIdlH1yoTfyS2ViW6uhoNfvHL8K5cgB9dhLmvSA4moueiTiGmBzgPzloF+I=
X-Received: by 2002:a05:620a:288e:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9442173ff4emr3213228585a.36.1793868772771;
        Thu, 05 Nov 2026 00:52:52 -0800 (PST)
X-Received: by 2002:a05:620a:288e:b0:93e:4e1e:aafc with SMTP id af79cd13be357-9442173ff4emr3213226085a.36.1793868772184;
        Thu, 05 Nov 2026 00:52:52 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm46154115e9.7.2026.11.05.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:52:51 -0800 (PST)
Date: Thu, 5 Nov 2026 10:52:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pmic_pdcharger_ulog: Match on SoCCP
Message-ID: <ch5p4bsgzkn32knbscqznd6yyg2bgbizyeoavagoj3yl47cxji@vlzovz3sqvki>
References: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
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
In-Reply-To: <20261104-topic-soccp_ulog-v1-1-e6e108ad049e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX6RqxwOGBFNHN
 QUVECVRQ2v6wIjSMvoARx4dyFYvAEuDP0hfQ/WtthLk6KfGG56RBNbC+g8WcSIEeHrqK/t9wi75
 7I8CC5wp7DpOVrk+GDN0l3E5eHBx5eC8xah8W6ZlnLx4A63IgoV5uU7QWKsBFP2grIZ2JCXEz7T
 cOl/gvSC8/K/CwkxtKvUsYJ7g/GRqgWGxPp0wHmeCI7tVnxPh/Qr2yt3YEppeJXgA+eL4yHDssA
 slQ5ojzan5Ug8wdt2WpntUVzznGPjf4BglL+UqJS0VdqnBYu80ravBN9+8ykokphxn2lq+reqIG
 dAvwGAOnkKyP+lRTEPsqoixNLh8uLWAx8flHkZFgjZHkeC13JCUPYTkVl1fihTaLNu6Q73jsOaN
 /zRoiPinUOjPJgpT6slLpdmgFCa066jq3yrq6APS6hnpKlHm3htOPnmVwsudsAQ4mqD2AM4jNDZ
 GrKSI0GOufK7SoZBlGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX2FvUIEbxmtpw
 egFcnIsYSiXX73X/3MwPH78PqO7WgM4lcN6Y05FMO1r5FX3+bLZKyAcElaU+34kadiU1Fua2vdQ
 ma23FtEtmwqhSfPEZzI3awicJUxivu4=
X-Proofpoint-ORIG-GUID: 0sSq5SiF78i_zUiHhA0q69GiVbSZrCp8
X-Proofpoint-GUID: 0sSq5SiF78i_zUiHhA0q69GiVbSZrCp8
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec43e5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=5ubZe29uNZRX4I1kwKoA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050035

On 26-11-04 19:43:29, Konrad Dybcio wrote:
> The battery management firmware, as well as the logging service, is
> provided by SoCCP on most SoCs that feature one. Add the match entry to
> enable logging on such platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
