Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500523;
	b=F5WQbjobndl+pF+4MLdfgN+tCh9c/tgW4FIQN39egtsZ8m32PYZHaKqPfrPUPMD6AQLk
	 juOYzF4Ll0HgqZ0QcWUjtk7SpjkejmDCckPFnkd0VRsT30jK9GWFPOOG2WQKsntQxhjRU
	 rwW4+k/ENEoPV+Pu1Iro8L7lxN/GzQa/OUYDYupV5lmpfvn2TX8kCT/JYPbWjceJYuxlU
	 QjzIL7J+WLBGZQlmAjCbKqC2Ap5gHcnc8OXpmxx5GUck8q3Ii1H52v1qGxDxPkIKwr1uC
	 IbfbWGnqG6mD0ruRZQDbC+pOEQyxOPWuwq6C2zAEnRruwrK4O0mIpdg1Z4GSIYTg7IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
	b=2O0XFY8Ic8oFgbNusdJ8lv7vo/eUnnZEvdCCKFIz1+p+jF1xdWS3Pnd8FvcSY5hQmBOq
	 TBPguBWuAw+uhw5r3A2WsWA1txx1jxzH+WM7HP6yRh67bmbqRhP/c6SFT0DzISshAMwjT
	 rH7OQpd5EFLdXRG0qOBOXjUSJsBEdi9pAB5ilPz9YlJwpzM8wXIkCQA6GlZZOJ5yq3kxG
	 SxAbBWVA5AckEJDqxR3OJaN9N/fXkpzcRGg0VnZo/Xerxvrl2p+ced+hf2e1ra3VDvmIO
	 fZsr/cu5RihR/Mdy6Jov+KNLs1x9Tnokp4Wc+abdzMaaG4s/S2TcdoNPWJ4AWUkA77w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGO29w+k;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE84606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE84606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mu+lZvdL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZGO29w+k
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k5Lj901797
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvY4KBfiISm+CQm5KIDUrtb6
	uzBgUaP0PFQaZpqv52w=; b=Mu+lZvdLXuWGpOkRTkHFjM/i3/zxBEn62CaGxwiM
	4QAwVoT9XEi4yAVQyTS/Hdf4oK6g4Bc9UAYdPk+DRdycbrtCTJCG8mMPRAhd8Itr
	YJhqFMUPxIvAUoO28f/gr9kwh8uoUQMFVNIJ4mHntvWYoUNjLLZJkNIL9C5NO8j5
	4wzwAtnHxt9pAGjuHvdm/dL4ZGq7SYRNZIslZ6b/jAPWSWpvoexho/kIjWyCe8Go
	XEM9WzZZfx7YDi8VBJiRGkruQKiQYtAWiuR5g/M2YJX70BEeqYi1vnUAfiYQx25H
	1Q6Q3rvSf1diwPrHavfw3ko6BktLi1o93wWElVUR6hp2Ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4w6sspr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:08:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so1039065485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795500515; x=1796105315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=ZGO29w+kZqFi0IoremOsMtN9bKkizaQT53H8YWFQDHShgC+v74I6+QopxA9VOzR3ag
         vpo8bEUIF8O5RsZIAg/OLAqOKRB/bKTx8+cSCgApxKM12o3xffG44Tb8wjTZkSkRmxCp
         wij9c01WUZzaDr5rVDD1SJT+iGxhVY2DGrilMJockekBI3nIm+ySQCHW9FAgGT1TCkED
         cBg+mmrXK3wzCDdfn6tJ9MkKWiw3B/ZXVhgrV+oDdRaYRTIjpBAkDMZ/VMsXJhU+E1Kt
         SQ9c84H9SufIQJjJDyuIlA/LWh9gOMXMRnrjdxZtJ49QfcTz5Lm9KRTSNNNdk8bu9nwV
         oZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500515; x=1796105315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvY4KBfiISm+CQm5KIDUrtb6uzBgUaP0PFQaZpqv52w=;
        b=kilGqDdJkscH9N3DxX6mWeCXz9doG0R96GC4NOP3EYAPBWusvgALJG+GgU1/FarxNI
         zDzJcLKROq9Ay1F+Nc3sJ/5CylOm99WqLgsJ97p/fxsw7KhNEYEHKYlibbqjn9UJ3ag0
         VcU14ENibTzykAGlag1hUer1ibuIkU+kRRmJxGSDK1IBPXN+2qX7Ded41NkE51xBmEzT
         C5UdrMyw80CEFrtNCkyHIZHxaFfQWDv7U3vXCyqTILUn+uw1PhRoVFqUn9EUuRAA2mJT
         x/VYYIj66XwaUnywzmuz7cQXmt7s1q7PR55aC7aoTCECsEUeuGr+sAqizBGCWWTooIGo
         IWIw==
X-Forwarded-Encrypted: i=1; AL+hErHBfu1aFdH7SzpHROJOlJCWgFPIZDbp4kPBn+XsX991hc4Xr6d/POO0wRcr9acshEw6+xk5HTaTKT/9j18f@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ixl9kSqpSN7nCpNIbY4WRBkQoYYDwld+bFTzOAbF2hS8FSh9/
	ffQethzEZwHy41XJ8/cyB3rmQQ2n3usqffZt9VgiHayP2McVfQF7Yftkc7tgHoQEyK07JhssiNL
	1ROOsZ74DvZt0iMp/V7kUVJW8GltQk/dCy9vfDuV2kVvz1IJFie1a55XKG+EgZJS8CWHp
X-Gm-Gg: AZFdTZfedsrJeRbUaLpApzn7ttgEC0lRWGHfgsZT1bHpUhVOOTBQxllrd488E/RotjC
	wXti+wH0wkRDOH8B4/9jB4mTFmeCQ1TqJAeThN8Ug4oFHhHV3UjWyS0JAE6jOqWDWUyJkA/JAsI
	vLDyUDEL0USGNhkh7lRfdk19lVdMAz1Fo6LgZKRExiUELhcRPaR52Ryv9TiFaX3I2SWBYo3wfwu
	jwY5o3Ng6wfNNI2Dh8P5UATTDCrgtKIZM3khmsuoNXaOE4TEL2bpvPbyXo1C5rfkcDX4FZ1gUvK
	cbaf6WfLhId71QD0pytLAOh/u5bDcevZFcN7KFwbkHIkc77OIFfHFJZu6EwKNG4keUjnrjUq31n
	DC/x8J8XUkUV9pgCu+4h9O04q0hysGctigJm/ooPC1lwpZRC8iMAkfXBEzbaj/Jk=
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433057985a.0.1795500514634;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
X-Received: by 2002:a05:620a:3185:b0:93e:94a4:a97d with SMTP id af79cd13be357-949ba683204mr2433050285a.0.1795500514001;
        Mon, 23 Nov 2026 22:08:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad644140b5sm23005124f8f.17.2026.11.23.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:08:33 -0800 (PST)
Date: Tue, 24 Nov 2026 08:08:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej =?utf-8?B?TW9zbsOhxI1law==?= <omosnacek@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Jens Wiklander <jenswi@kernel.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Scott Branden <scott.branden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Cochran <richardcochran@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, xen-devel@lists.xenproject.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kvm@vger.kernel.org, linux-hyperv@vger.kernel.org,
        virtualization@lists.linux.dev, linux-sgx@vger.kernel.org,
        selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, netdev@vger.kernel.org
Subject: Re: [PATCH 10/14] soc: qcom: rmtfs_mem: convert mmap hook to
 mmap_prepare
Message-ID: <7zkdydihgjnqxerwzbebrcryry37hcqc47dpzqmoxdgc7qt3i6@uanst4lmvvkn>
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org>
 <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
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
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-10-c56aadfbab8a@kernel.org>
X-Proofpoint-GUID: hMJBjQa2MjUlv4GrA4TXXtnyEPo50gYD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX+4MlADS/AwWv
 arUzgqWp0rylk0uwTdBwnaFMxmkMIzkOFylgwdxMGD/adIJopIe8sGQvO/KqSz3LQcJLW+yeafI
 cfmj0jdXtu3+jDlltv4hLu0pUxLe3NM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNCBTYWx0ZWRfX5RKqHG1Rslcr
 keeTPP9aMACVG3xDseZRyTjU5QU5XeK84wDSWVJAYB3+Z0DN+IgvnmJL60zQK0en3KJai+4SL9D
 2zv4qY22VBpABrWMq6tjfjXqByOHNHGL8Yi2qJGMJMHh/Ap1VhBqUt8cSxlR+Vd8IcruS6fqoao
 pHisSd7EQqjaLuBty5OGGy3TmDp08Kw2dPbSq151/yf/eMTWxnisfbcklzSFlYaoZVLzFUtbkZA
 EPFClhVeegO2bPa/1Hjf6xENGaM0wX58iYQxPySsdcFK+U0SXSNdAWbl41eR+9EU3jvLVMILAHv
 GNMC1PMCGE8UesTlW1hREHjEC/KfJjaj/haexSzhms9xNh4qxbrHS8f5Gc8QeGm/cUayUksKnO7
 m4b+SgClBwf/LuiAek7/fD0ilH//4HyZxoqlTtAtzfgqETnnnEmUUx+sBVLgoceaBdDKyAheezQ
 PNHIuB3FjAfjK2LtQXg==
X-Proofpoint-ORIG-GUID: hMJBjQa2MjUlv4GrA4TXXtnyEPo50gYD
X-Authority-Analysis: v=2.4 cv=V8DoQuni c=1 sm=1 tr=0 ts=6b0529e3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2UNkV1bVvYdQOko7pskA:9 a=CjuIK1q_8ugA:10
 a=QtEvL3ry9E0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240024

On 26-11-05 21:05:41, Lorenzo Stoakes (ARM) wrote:
> Move from the deprecated mmap hook to the new mmap_prepare hook, using the
> PFN remap mmap action to map the region.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
