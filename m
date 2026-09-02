Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63B4A43EB
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366550; cv=none; b=ERxKJihwmwPCuIWN8L9MJOwqhb0WqTqZ3BDV+4YzEX9E5uzKzNcCMuU5KTTkJrAk1hj241h9PKrQWUII4HjG/ilIQlvyhzbm0bgmAkfwR8hf8iubKVAfNIboT2G4+v1Qbbdt1BtyKgVD42u3OaDjCWGqa1kl+/8Yl1mCz3y5G3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366550; c=relaxed/simple;
	bh=tDojO+9BEVk++M6GICcmNllqJSFAUFCqrnceqbKzFgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SwGOjT6jTv/jxVCAs7G5cfshlyes9IULDM6Y6SGFJXmYFET3H0pC+KTrOQx/g+Zv5UsCFD2dSPeeresRNeWsHsIujFIbIjXcef3X0n+UlShxJmOxCuhhA/JCgqfxeaWimizGwoXXWgZWWRy1CblrMktsuxmscDU6BsuuVDd/ywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKj2fWBW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b+4jpGdh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKj2fWBW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b+4jpGdh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682FZoOu1968751
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 16:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gaRx+QAw5TNdv7ApNve7Ep0kaU3gmKx1F2L7nke2MOg=; b=eKj2fWBWy3IP9z98
	ttR00tuafiDEs0vA/78nvcech+E/W/p5nwNGoGphTODCpVY0aYkDT6AGwc+g8x/5
	2YlGgYWbD1aq3tK1qa2QcK1etDul98uhC1Tj4zBbf/q0oxgesizpYVatPbdUC9RY
	X0m+dFlMFSoygMr8vPHQht8PdwXI3IzFbQudL244tWMup1IDAsf7eu82no4Rz2E8
	lrp6S8ebp4SgKcPn1H4A3KtjaXB+0M9akSFJWIAwZtlA3UPY+TOqFdJQXOGgAS7c
	S/UKTvtQxewPS40HErFXV56+MHB4ISx1nriYqvOCy52iV69mT9tzmfEdt8Bb3Emz
	pZTHng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c9e0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 16:29:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9392788b3f8so32392085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 09:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788366547; x=1788971347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gaRx+QAw5TNdv7ApNve7Ep0kaU3gmKx1F2L7nke2MOg=;
        b=b+4jpGdheS9YCzKMPMgOK29mCkEnJDRpirHaXt8TkNMJDjatV+SDOQrZ11dc6VV3O+
         BEqXfTGlvmzI2WKcePXY8cOo+kr5L5d2HFKJ9fMTgLw3yp4jOdaw2ZkQcKFay/Z+aYUY
         gXTBZcWOKQRYMMKg2YnmpyCHBwCzajyjzPReSNdpjNh9jZjNcsnggvzynM6zvifIje9t
         GB7zq6cZB3LW1hAztnhJI3u1aMusOwTtcD8zHe6PRVSfI17tV2lUND5n/pEk62DzAJL9
         by03Jzb7Zm0PaYSiXgq1ZiPNcqLOPbRDB7qgD1HSJr3XPjo1wZ/mWJp8f7PoYzSfCSPC
         fabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366547; x=1788971347;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gaRx+QAw5TNdv7ApNve7Ep0kaU3gmKx1F2L7nke2MOg=;
        b=DYwd8nLBkmAGPpaSqRt/lt8dWe0GadAcOvuLXfQCgdjVPqPsbE5EoDqknD6AGLqKal
         t640qGuSbTsRDPkn8LrOYQxmA6IIfuIkZOZCDF3N38i67llNEgi40hCEsfNd6mrW7Wtj
         c/s0CiWe2K6A9Gz+AEqDBage9lqxG1OzQRG9T+XVCWhwpkxT1UGzg7Vnc5MbBpxddOGv
         k0mST5coYD1XBhg8DPKkA3N1/r/0nn6rzhOSFHlzkYT9DIMqE+HCUy2jA/MLjEu1SvYm
         QPnIZPNlQO/bZIh3tGaZagCkh1SWF6TAB0dERNmlVxRBiNuegwSlE2MlDkImARdPWgEp
         sZCA==
X-Gm-Message-State: AFuF++kpPfF9hNZlMfH3YqyOK3wwhnrnDQBAYBHulAXPPGNaVxmwphTP
	EI6m8PBnArANJ/JF3uAT33IvM0UBBW463HBzu4lJ8YLlWM7jaVqn0NgIxWXi+ul4HsLWPo8BtSZ
	LL+80jbHzddUhHSAk3QlqkyBYvMX5iy3tegqxwF1vAhmS+mg/7LMHucmMZkgryAI4dseN
X-Gm-Gg: AR+sD12G34nWMQvHmez3xjvD/0sbSyd9sjOWH7wsIjvPIw4b2QP4ZICvJ92R7v/+mrk
	8L2QHiOSpSnyN9qQgquxLXvKA+Uj+F3yBniEkYEhvZ2BL3H/7Fy1TMW1Z/gi/DnvliTas9tSZmI
	cWzYyio2Towr3KSyL1xDLaW2H3yqpRT0KQCYYyhz1I4pGPvvpkChi+FTNpTMVuXLMnBQYMSVw9S
	axU9DXI5IANJraqVl+TmzKsA5Df0RfDHZo7exf7mJAjcu07cpgOls6FGcsgyc3yNMgi6YQHFBNp
	3QxtYuRFCKxvu1OYAQ54QOBPrDOFndNKeg55KMqeipgy84zgAu5xkgxxY2ATgZ5wdVUgeoLmDxN
	RJauWQT5iN1Xj+nP8ek3pHg==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr408222085a.6.1788366546839;
        Wed, 02 Sep 2026 09:29:06 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr408217785a.6.1788366546236;
        Wed, 02 Sep 2026 09:29:06 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f932abasm1285886a12.16.2026.09.02.09.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:29:04 -0700 (PDT)
Message-ID: <cbca4156-a461-4d01-9576-352f719016eb@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 18:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 2/3] arm64: dts: qcom: monaco-evk: Enable SDHCI for SD
 Card via overlay
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Shiraz Hashim <shiraz.hashim@oss.qualcomm.com>
References: <20260826112456.482982-1-monish.chunara@oss.qualcomm.com>
 <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826112456.482982-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfXyA84yqFUhEsz
 5mFfm8XwjE9VbCTMoywbeEM4GviaMlI0xyagLTQmcx4IMeNVoj8K6ILllcaBegidogAsKWwUwVm
 KkTXOkQo90P/yVPMC7TC57PTO9AEk3k=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a984ed3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0kTFbZp8cJiOs2Wp4RgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: YF7CLj71Wu7bIFQ44fWeowyGxu_cew_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE0NSBTYWx0ZWRfX0/f6RkM6pwZc
 eVAyjPmwyaonhYdFn6b13tSqxiYQYLdkfTZfCBol1xMj88hPHK+LbxDscTJhGB9AS8GfUUgJQCF
 sPMOPRp8Bz/aCy9F3ZA38mRRCp13oV12pHyrKuAkG2YXBRgbEEBjQNfj4jbLPqSn1flz5h02SNA
 fKZWVWVBJn4Y6rqI1mHllqzZtXReb9/FtLNi9r6s65y474mqBm4OU0Qk2TtqeKfcAzTAL3QeLld
 +XYZ7UfLUfq9LgAgW7P5qnx4Wv144iUJT9RVJDSjwHo3tPPfYzoybveVCg9jaNEr6Dtz0Xn2RtN
 GgDiOUPlcyCc1UuUiLH9aofTO8Fo0fpC06qLRrnPRvgFtFr8ZIWuyy7St5vg5/f8rnZMQZtX+7z
 naxU0Z5pDNSGCmC4HCKWSOo+5Tfu9kRqldOzF3r6lQrTqJTETyjEWmQ7ok8rDS67G0ouUnm7FRo
 /fJGH5u832LbHWu2IyA==
X-Proofpoint-ORIG-GUID: YF7CLj71Wu7bIFQ44fWeowyGxu_cew_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020145

On 8/26/26 1:24 PM, Monish Chunara wrote:
> The monaco EVK board supports either eMMC or SD-card, but only one can
> be active at a time.
> 
> Make the base monaco-evk.dtsi storage-agnostic by removing eMMC-specific
> configuration from it. This allows storage media selection to be handled
> through device tree overlays.
> 
> Introduce an SD card overlay that enables the SD Host Controller
> Interface (SDHCI) for SD-based storage on the monaco EVK board.
> 
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---

[...]

> +&sdhc1_opp_table {
> +	opp-100000000 {
> +		opp-hz = /bits/ 64 <100000000>;
> +		required-opps = <&rpmhpd_opp_low_svs>;
> +	};
> +
> +	opp-202000000 {
> +		opp-hz = /bits/ 64 <202000000>;
> +		required-opps = <&rpmhpd_opp_svs_l1>;
> +	};
> +};

This only adds to the existing table, not removing the existing
entries

Based on the previous discussions at

https://lore.kernel.org/linux-arm-msm/de10ed05-a0fc-4f84-83ea-8810270ff2d6@oss.qualcomm.com/

I'm not sure this is intended

Konrad
