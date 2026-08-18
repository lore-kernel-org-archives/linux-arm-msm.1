Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09485448384
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045353; cv=none; b=CyhK63cFvmG5ybhDoPmlRX6b61sgu/wMNVp3AbCZuIIE4jtfQAFUmnfIL1aXafjh+1JR1TiLDzhleRQHkPyGoMHmAVqHyqivthyO7bvvdI6/wAFxWA9+edUtL7SLQyAMbOTG77jgEh0tl9KGvsoLNuqi8xon9VVz4vQ0w9zlPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045353; c=relaxed/simple;
	bh=Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXkUUFfK0zaYqDBP++sFMPQ8UGxS71+XYMp//uestA65Xc9cduLPFTck6T3HrpKuLB70y2auLRIgwsYNBQ//3wLy5t6bJnlT/CABGxt4mMijvrpc2GWhf0sDOUS9qOUn6sGUVN8JSPc7epbZjGtElRSIAbsIOLYnVe6zM7Lr61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd73Ry1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2v4Ggcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd73Ry1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2v4Ggcb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJhB325459
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=; b=Nd73Ry1qzGhkKemy
	JQ8GbMEFS7NX8kt4aXHxqxjYMwrRQcmkWP0Sp/3aTqeQD2Kxq6yM7Ns6GJ84SQBH
	6RGeMlJeSXuQx7BandcSjh6LiyH5lRNqY48DRNYAYP0pS7/7FghN02p+gnvN2mZ3
	T6rS5R32oIf8s6NzQUHybRvMzh9LJkyUljVIJS8/jiZuFqjmTwJiem5VelDPqvtI
	6eaD5xXBqJeqFZKXrC4ozHUjo9CEgKk59hLiwbjPEPJu1H8tBSicORTlRrCR4Q9v
	h/xZTcAxtvYZ7Nbn8Syo12/gwljg7EtqhJp7VbmUZSR/CQZXKNaTS8ks302NyuxJ
	Giou3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtsma6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:29:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52b4e315000so1246811cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045350; x=1787650150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=;
        b=a2v4GgcbkUtWxne2a1MN5U6gWn5yM9hDEOzjuvcbLDmDq6MtW3ry2+tBGOe/3OMuoS
         0Xs3v8amEe9kjL9OY023FQsOBcyQujAOpZ/adVahi0zcAnzrs7abUJX0luQYsZKOnWAn
         i4nOjrUH7fkwtuQe+PMjzMTyulwCnsp5UpOUW+IApVmRGbHveOgUjz+PdcWVuQb8OP6V
         4CXC4OkaCMmtgwhaJ8+AyJGnh6pLVTrb/qadYH3OcWO7EKF5Jha0NpqUWgLrcfuXy4mu
         mNJVmVwR/lpF0rgCsXmDHLIBfy3DEAbGThWSXNRmcC3iaWHcD0YHis42BBSSYd25lWg7
         9HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045350; x=1787650150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=;
        b=i1MV6jgj8C/wAcgg4oD9dOAQknkIr9NFHXBbsxolEm8NCbl0CYKmBLokScJz6XCM8m
         cTzI1nliMR90qHZJE5LzS+RlWi+4MXcPSR99jAlwa6towYpkTdNPKI6KNTmSLB8GL5m0
         XK/vimsdG5OmNNz5s1mJ7a9DSnANVuPYrfZ2qy4DzybNKvyLdw32TBhNg5vbW+OimwGO
         b7CCeGH6wC+5CTJFoRURIAccrL5yymXrxdtCKsWqEpPrWv3R2araz8mNwo1fO+UOUc9d
         vBxNUWoj4Rz+0Ah1pdCGN/u2kx9wUMfdl6qocLGmP8XJMoy1+Qsqj1NTi0JJ0pOG8V5t
         WOjA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+X5uGyBqskqT4OTfY3gFLt3JfzunupZXceARgaU7EhrlC19FNaUZqozI1ezVUAGYBoH0Kv4uQfIS5BsI6@vger.kernel.org
X-Gm-Message-State: AOJu0YydkMa162n7z/WrH9TsCCVPVRkjQxBqi+PoWaoH3ZJqQe+Pi6/Q
	eYr3mTZOjcJ+yeNIn9aySf/4xWce7Ysfq9lxFRczV31skk4R1SlN6Egl3H1DkBKOFCKKf71ZT+d
	Ch85T2us+iGv1mlzQ3KxqhQR4Wmtf9vTq4s/GGSnV3ukRjHdvmrv2XUlz6KRJlBj5760v
X-Gm-Gg: AR+sD131nUdS34ohmCYA31rkV4aRn3Ccj4FHs+f4W0+eIKD6bjRT9sBfgWFwek+O410
	IF1b2f5PVBJAaeg+T6BL4kAdQKQKi9+BS4efeQgrKR3U7DfM3xmRJoxzW8MmSrVZ+h8x9NQz5Ss
	i6wxE+bISSY3/g0qzpTCkqsR/F+xUKnqAB6XoGIJBW1ocBzfMQkVaQueCp8+NUmbQkv62KhmVlg
	rZJi1GlWT1vIrowyR2qPYtqNH3vhZxVhuUvRlJI7n39+Ji85NMOevXuS5N9Aga4dwBJ6xPh5jSI
	FybMG3R/89XoAYPEhPyhbIDf5n+Ow8acGlUwb90BJVdhmezXMOZzRVRqfd+h+A2kkNpGT3nIEUH
	yXco/hvp0htOc2Pi1EyQ9q5yS
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr243806931cf.2.1787045350335;
        Tue, 18 Aug 2026 02:29:10 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr243806751cf.2.1787045349958;
        Tue, 18 Aug 2026 02:29:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8530d3bsm1694606a12.10.2026.08.18.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:29:08 -0700 (PDT)
Message-ID: <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:29:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI
 transfers
To: Jesse Casco <jesse.casco@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260808172211.137577-1-jesse.casco@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808172211.137577-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX+xuet7DMFgyX
 BHX7Lg8RomtZ7amaN5toEXI/Q3Iuh4oTMuYGUl24lwsbOEW4frBwWPThhvoaHwl5gvNOjqvNyBW
 iyDqIzTGxwwCpVQsrDqoznPTGiZcSWs=
X-Proofpoint-ORIG-GUID: _2PG9PVzmYjcbuxvsB2Sy0uAd1wKWO-7
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a8425e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Yvg1zlJodvQbsUTSnWkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: _2PG9PVzmYjcbuxvsB2Sy0uAd1wKWO-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX8inTZndePYMD
 ZaCl1V7tNY/Ks1bJxQSMe/1Pwx9ERqR/n9cf7gFhE5lVPEqJNP7sUgdhbDqCRNHTf16DZO39J7p
 NpRtId99ezKnOLLb4RDqQfXgMGMXLgjlBfQU4pb/UlqyCErtS6Qvkl5mRm3ErS+DLCGQTTOdfNQ
 k6LDHHHtpJ8KRosZCSTVUe6E+BPmroc1fWSt9nBKEZrsO1v0EG/6HPovpqWcZn53X0Yu8s+Umgm
 CzzOcONzWR07/0y0TwUXR3gLJkzYmdaa0mBnNAb/e6q5x3+qeCT6GdTk47qph5tO4sozzqXOuD3
 T6N9fWmveZs9trSauZNcBmaKC6Z27tSeNRpD98mt5WA9RUwbcA98W53cHfubLEGqPbwiZ4mZb92
 OG7C4gGGHG9HTBroyjNsedJrqlgyZXSZ+x2q8uumZqxD+lYF6tLz0x72ZXvPXjwGcJMV2bX7YPz
 HMZ3Z4cs7eD7MICqwHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180069

On 8/8/26 7:22 PM, Jesse Casco wrote:
> On glymur the CPUCP firmware writes correct SCMI replies into the shared
> memory but never rings the mailbox doorbell for them. Every transfer that
> waits for the completion interrupt therefore times out, scmi-cpufreq
> fails to probe with -110, and the machine ends up with no cpufreq at all
> -- all CPUs pinned at their boot OPP.

I'm not seeing this issue, but I heard others hit it, possibly due to some
timing bug. If you set your kernel config to build all drivers in (i.e.
change =m to =y), do you still face this?

Konrad
