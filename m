Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639627;
	b=s3KwOZzeHb7K1Y1qrE51yQIdZKd10fDej0pXFywvRJXE+ffzgFgo52Gfj96TJTro5z9v
	 km9uCPPuvahwO4Pwzj5ZedbxCJWyLgMxpapPEQXZ1m1svDeM9vVh1yi8ONQX/XBpTqg4c
	 wpqTVGsBM/qualnLBYVadUd3+t3CHcoVpktuqvNsr4UTsnIXK0i17NoXv8m+1oSyX2uii
	 p+Bcx8oPtqFNPPlCFt6n3/TUQdW3yf2R6OgkMFX4pXTpQghjOdmPs10SdblPSp+K03SoQ
	 1xfnmF9dG0h3zYboggvWez861b07QaS0gJ5LLl2YNw7lHbS4RhJyO3+S2Z9PSzvVgsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
	b=qz42xQPEqma3pXkLzZ9/NiDShnsT2EERu2lMrXPtzwP0sen5sgQ5jGyig8UNecL9UujZ
	 p3jAxyky7IIwFUwkfWYQKZ77vg7ZdGZRZfPVCAo2tTPCsNVHNI0+Uzl/ho/f/FfN3AB3P
	 dnXU/Nja1sl5St1NXTTyeweQSGKFiA89hnTPlKJBrUMp5wZfv+XCW971gz1JSh7PzqsNr
	 p0iFZLx+pbPEfrz4/F5ZepOgsKuiDTNyONfIgZmSywQNitr2wSd5wqCgzXd6QUZgBNzUK
	 34u1CIvccN5BQmzs+Cb3ghXcNMM/HqV9msRD7nXdgxgtAvQog79yhQD7p758WFdVhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phO3eKgp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pii21JKO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E43606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1E43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phO3eKgp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pii21JKO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M0jH1S2022274
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGmZmli6XEiqC9WcTdozsjPu
	YlwvOxi9MxEGhwdmAzI=; b=phO3eKgpY/wp9HeFoWPJLOFWRlM1OzwTbpzxGa2u
	lNdCkKoH1oLccrWYbrruuN+KYF774iz+2skToZakXZlWL/ctzgyQMGk9U5oF3oJU
	O2GLjwTQPqt+AzSw9XzdCFt2HswSRw4IBawDZsbP8428R6JF9umjqsdJkCfnOvXr
	KH0ajGUv8//6uFi4kFUKRVCjOzIQE0wlEgdQy79898jtm0jYo2B/qwU8uNHVJm6Y
	LSLKB+Ql6HEsgqTZ70Junp+ueEogCKCeZ4bjTwQsTik89CjlzmroNHMIooqG0ZCC
	Z6UGMMk4/TOeaFviVlwV1B/pAcHZSULKPspIq1pcCf9Hpg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2k7eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 03:27:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso2195330eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792639624; x=1793244424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
        b=Pii21JKOA+7a1HFfCqBwn8A9fxtGhIyIYBlnAkjSixur7eOmG1Boe2Dx6n+x2etO51
         gw9wHCkXHa8w0YQlZtjbBUn1M+grXwIj/sEhKWmPBylGWb8wsaCXGx5wt5MtpAcnhQWb
         X6meJnMrJH93+VKhZuHSK4+DOFNths3jMrdVIy43sT2bIdCJCL90QpyiLFmXiWxX7WYU
         vQ2IhOD7bVyK1lCG4+wqpVXK6dMeuMHWpDDfxdY3K59HwjGCXtO7SfCIPOeFqs6SlhsF
         msmIrprEE0h1APBvl5ljs+0SL0ngEuuV+96XDBQMbIbpMHc81Ac+k0kki+iU9wKcwGn2
         TSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639624; x=1793244424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
        b=1I5xeL4bZ4CnNq0bKuxSmiWAurWnBYTirZYW9Mj3bMiTHcd/0B2ke0seYbQRru+WAT
         nTNQ2BHRdwfH0AyXlVlsfLldzU008LRKgxqNLZgutG4R+JDg/T68aDOccoGd1MFUiyM1
         OglEJDqMx75M4wYWqGYsdmpJ9HBFGALhvYazrABGYgwnRqFakU7iKVirENXRLOgL5tZH
         PHMjSH4lO9I1xeR19DfmBUY9RfG5Saol1gz2CNYYB7F1Bk17H5T0+trR9zu5l9Ma/2ms
         KHCk1A75aSA8Zzr9B8brOaIHLfF60TaLJvODrtDvZ+gaszOobOEyOhHGzmIC5oFs0cfF
         jJ6g==
X-Forwarded-Encrypted: i=1; AKwUvByfn/YjMFIWa6LyuHGqCMc5vt2HgbBYtdaHZ1Pql/ZYN+CrGbPK8HbbJ4dX0SDOCcQRwi3J8SjsXrsNU0YU@vger.kernel.org
X-Gm-Message-State: AFq9FYJXnAYq+NUrsJ3KExlxJ7hVvKzACSZqydkdRRiGGAZ9x53jc/Ha
	/9ey6WN28NlSLBwH1eUK9arAIElra0zSHLPaOvh4r8qIaMShLV81E5mMfNjQPcFegWor5ccce7H
	QS5ksX+OIiWJzej+y20uqumiwqrtjg8X+lCnDYXRhIhAdqPjdA1iJGjxJj47f683cedVi
X-Gm-Gg: AYBFou2JBwtq9YnJLYuycSwEe0N5jF3ah+mGLPjAMi0Fp4F18SdwIG5ClGCE6KTqxcd
	CMEzwH6me+ro0dk0hbPIQBFQgWa15zSHDLrubiJut0aBCWmSBcVZ9O2Xy96C8dcYpos/ZvFupSW
	d7VNIiDjldF5epST+QjaHjJOKp70l+TS0WORg8/dXhaXOtroS67QJNjEZ0/Hm7EdjxfLh/RAGQE
	rfNAhhTJ2TBCIdA4zjY9Ga42q/1MODx6VtLDcHRWL7OkfbG0UgGC8vlvpXzr2BQJuO3SB3y8oLq
	gqynZxAt5blMMoYWAIzP6xyqwVzUA8EcBvDPAY50cHC+MUBEhqoitG1TVK/i3a6mjs0rjHxbw/Q
	1G6mqXA0FO7xLKjraynEYvFroXKum+X08pVn7OlKLFCEkgE2s
X-Received: by 2002:a05:693c:8803:10b0:368:8ab7:2a4c with SMTP id 5a478bee46e88-3688ab72b28mr1840507eec.30.1792639624377;
        Wed, 21 Oct 2026 20:27:04 -0700 (PDT)
X-Received: by 2002:a05:693c:8803:10b0:368:8ab7:2a4c with SMTP id 5a478bee46e88-3688ab72b28mr1840490eec.30.1792639623830;
        Wed, 21 Oct 2026 20:27:03 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm17373764eec.24.2026.10.21.20.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:27:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:27:00 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: fabricioakio@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a
 host with wakeup
Message-ID: <atmChJYMtjPtW_ZE@hu-petche-lv.qualcomm.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
 <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
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
In-Reply-To: <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMyBTYWx0ZWRfX9qUGg7Ny1/Yi
 p5oYOM44r3O/PLjdrfYBelut6+beGkV/XtDtVYljxok/Hh5EIf7iTHE5+4Eu7X+9aNB/coykeDk
 8VxVbdmitkML0Vmm2bFpvmCxIWI5ifk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMyBTYWx0ZWRfX6Un/eKmZpx47
 ckWH6ov0FieSGBQCBf/kFYayxganyIk01xXTmzRXUNsnOtDVWdErIsKg/fiimzpETMDK62MVv/j
 Ba00fkjUhlca7BTduvniE9lvy0dnoX9QaPDtQmk5C12o1bva2AHjaUT21Luing0EsYSInb75ukU
 RjAkk4n7LmSY2AEuK2tE1YWHwtb+XzDWHJGxlQ0lKUuds3+Hh043a8bb1ah3K2NsneSsGAu/TDm
 cFsJhZTXbzUOMclGUwMFyVTlNEARL84ky0/JXy6o2FdICQxpe8aYXWi6u4TsGs70TX65IGqJ6N9
 XM+PLawDHloPMZbT3jhYNwmKiSCP77SgNMP0NutDPmfGjxqSrDv4D/TRpEzwbdjWQnopkVNuTBp
 P8sH3q2xtjQNzTUOfMZRclQtm0vONLPNEIobRejzLxq6PJ7+0GU1HfEn2sK9DstjdaPmIhkXEvS
 oQnE8Ha4JFj3kjizv+A==
X-Proofpoint-ORIG-GUID: V3o-oDzEKlKmMkhyYCZXFiQ0FacIkmuV
X-Proofpoint-GUID: V3o-oDzEKlKmMkhyYCZXFiQ0FacIkmuV
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad98289 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=QFNGBFAix9GFkXGs:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=uQVJHn5EHz_PyVhorDgA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220013

On 26-10-21 15:44:52, Konrad Dybcio wrote:
> On 9/28/26 8:16 PM, Fabricio Akio via B4 Relay wrote:
> > From: Fabricio Akio <fabricioakio@gmail.com>
> > 
> > In peripheral mode the core disconnects and powers the PHY off before
> > the glue suspends, so the link never enters L2 and every system
> > suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> > the one case that parks the PHY in L2.
> > 
> > Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> > ---
> 
> I think we should be able to retain the link in L2 in device
> mode too upon suspend, but that needs more plumbing on the
> clock/gdsc side? (+Cc)
> 

From what I see, dwc3 core just keeps gadget (device mode) disconnecting
when dwc3 core enters suspend. The reason is probably dwc3 core wakeup signal
(through .dwc3_gadget_wakeup or dwc3_gadget_func_wakeup) is send by software.
When the system has suspended, no software has run, so can't trigger wakeup.

For runtime suspend, current dwc3 core doesn't consider link suspend event
(eg, L2/U3) as low power event, and doesn't put dwc3 core entering runtime
suspend, so the link is always L2 or U3.

Thinh/Wesley, if I understand wrong, please correct me.

-- 

Thanks,
Peter Chen
