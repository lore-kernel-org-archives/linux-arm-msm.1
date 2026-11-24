Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795505878;
	b=uhsnQrEhw7YMWrVniq/ziwZELQ3VaWTRmKcn1/EuPzq4vFon5no49T3heu0AtlUFiQh5
	 MppIKa71nv66+U5BKfcEgrLZJkI+iY5vRcmWLs3f95NJVKm9EoA4YpaMorVdweu8cHhNs
	 HzpwCJGb94UJDZe3/Zotz2BtDy0R1HOzPEGzfgcNxvfgoIo6CE23+i1wsyMMtLDRj3h4q
	 Bzm6TOiADOpAGiyx/VTU5KEZX6QLg+qt7JcmCCWP856cYCLJiavc32DBUsGjZibq8rKy9
	 8h/bGe0/x7fg4SVKTzyaOugRO8Fw9Nees8rNF/c/5yJKwr1qS3ECp756/p3jwAZR/RQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
	b=h3jc3OKR9Olak8cIQ455BIWu4N2oFe0iSZPZWzTDRh7ZKbhqctrUtu3e8rnJvJps5+KJ
	 m41jtdLhZjYB5ipqwvkEzBpM8ObK3fpRPQMp8C1MTdDvZTAYHGKKnlXxzwQr8ThX/QDSz
	 aiMgNgHn2k8s2RXoBpNJEb2fY+bmOK0rFxFBGa6kOFbhBUXvMxDmdZSHZ6UKEh7W3ddYf
	 lwTb2A5AXkmWPbE0L5e94HbuOMrfLoZE8a+y6KZ6MfNF5bE7L9+d3mw/GHU3ZgLEQUMn1
	 TInWXytoiCWiS6xOAXIA60cUZiSKQFqW6b96d/BxB091gX659W1uY8w+Q04SOIm32kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1+Iax5U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B23606A33E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B23606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jB2OhFnb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S1+Iax5U
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kDOV197024
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=; b=jB2OhFnb5kcQJfBh
	9PooZCIYHGNUVjDcGwumXONQT2rphRiM+HKb+Z5rBcfoZ9URBb6HmUCKyU398p1z
	0DE3n1unAJCPGSKA9qHqDKxoWrwnFiNfWRaB4F0mZuQ+gIyw7qVkk0rFFWIT+hr0
	xlGvD+nbKD4m1GM6eRm0zn5N+zABS6NWAAQ4zM+xLUUTfkXPLcKrmGNQSuaj6NVk
	LSMFCUkYtOrVzKgsE9JjRJp/p/+NgBxqv/l5UGfpSyCfsEnsySH6HhHWtAFvnFTH
	QiJHfUK8nig+0y+RvbrdRu8nHxWlPz45JWmVSfVxj87VvZ9rM/3qatNGi8g/YvkN
	LVZ85g==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukradkv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 07:37:56 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b50256700cso64738107b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 23:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795505875; cv=none;
        d=google.com; s=arc-20260327;
        b=E/HM5Uf5F1yHgPnzpaS3B2U1twoqj1kaTq5L0QviaWDjxGyk5NYpxb4fNaXPwlHHxA
         6j6/38PFdgT4tJWthac/nom8znOusMJoriGbIl2JezdANBev/rioDmZwx6qWJA/jzSNW
         FdZ3iexK8uU4DUuATzQCxjZA/twb0jrYZ9+L+JAa2VT/sOpoDNVVAqeC2SweYXRudLMi
         nn+S6KeRzVWx/ltLFwU21Qorx1uAoK5RhujTuCQIDlvbTT7BviCYQKtRSYQ4qZHToaMV
         CZQZPx1lO2gRRlWqytSguwBgfjNWH3Tf6uHIqE3b5xCytnsvokaf/PssUqZ0+LdE4BN5
         X0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        fh=F4BP/XZQ67DlAUml+zRzQvBUEyZLJWAGWp60bqp9CKc=;
        b=FDRwMTD2a/SbI+oFxOu+BmGXJ9+8+ROoVFzUinB95DLjnR5Zhkh9St7MSbwgmwSTa+
         1sdPxFoE1q3RtOqjyq6yWqoGHxHl8Fw5NN+M11tUGWs/gv6sA6mNRd2xabeprUcUIyko
         862rCBWDmYSgZ9IdLH4a+K3zZKRaKW+KGcu58aMOs7tLg3Si8DKBjFWQkSnwFd4qBRzC
         6kiXufdWcmox5k2PJj9nftO6XfL+pMk9bTRTfwamvbqkEfaAr86PVACHK4LlQs/0B/P+
         +MZJVFhTIEVL5GgQqADCtctiCKofaSEDBcdJFa0yEKI1hfbpCxjdBjL95Q9VOtBeEycK
         LVJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795505875; x=1796110675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=S1+Iax5UjwdrBfjmC61+6GR7Ef9vLvndZMhbV6RF5f5jjGfM0fKOFIGSb9cZxbE499
         ufQ0Iw9iW/MkroytuRNTzxKljpJElsFF8w9uRLGP7Avq+RZTb57Ul1XAJRZ5qQA1kqxg
         7jbG878tFdG6DzFw+/37L1jhd6FV1aCc7/cXrp+cfOfsQhmbgR+jpkWB2+0CyWhWN8/h
         yrF5TtN9QZy1tEKAfvOEpPuv5AnxPa6u6OCgoeLhGxjDwK43OfnV/PUQdhSEXPtDxnYS
         FFlkC6lp8vy68Kr1OCdhQERS5xVbG1XGyggIdSHRH/KZmZy1PSroQztV131DD4SIsduA
         xQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505875; x=1796110675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLDBCseQttjsh+YgjaRZ95arQzmquJXtwPce4pg+uuw=;
        b=f4S9CKKfMrMIa52o4lsSVIZ+ZJd2Um4gE8XtzS/vqH38bv5qws8cnMQQ6be75geJ4x
         U8glDNpZfcaEAUV6HRSK6opvkftkyTaBIITZ4eNdwo7lXtaI70ioAQPCOtLgDzo/JsCx
         8NeoFQ1hcknn29ytVlXUzeMGtl1KYIj6LboJgMcb24YzOvG4Fnx9BP/7+9X7GU/JNicI
         JnEir+KHXoXGnVr9iU0gSIqUSZ4CIqCGCWWcLd0xX42IPGKrGDlfJiEOTI6KUE+stp/k
         x5HoQutm9uiQZJ5yBgdWZ7xpBeTyB/5Va3E8PlgD1UHZaEiQpqifU1/rILhBeODc0b2R
         Z2IA==
X-Forwarded-Encrypted: i=1; AL+hErGdg1RbIm2stskmNkNphcSFlsbEnEVOjqwJ9mMu9C/WlE8flfb82tec0t6OD8akxdN6x/4EkLh20yoBp1lc@vger.kernel.org
X-Gm-Message-State: APuU4Z8HM9+1IyLepojUwxLUMsDXMlLK/+zs2ZI7ziCmHBUdBN0xuq+9
	3XJPrAEJYw+hvX/w8ES4XVfXgeAONIOcG/eKDM00MB/ZNBbjjaVbgwFckYYYMwBBHpdtPkqKmyw
	YKIIbH5trJNjizK9Ar1EWiSkd/0EwXrETGxAqfV/TWnw9yiOD6rhbDA/TomMMiXhQCbplMLuIVk
	xzvh0Jh/9Sw5V2bANGcTA6PTmD7Zk29Z2j1D5ARS1/plU=
X-Gm-Gg: AZFdTZc3/jn4htMcwPEPxRKmv1kxf0YVo1l3L59KAzfFhNjyiXF+CEGMEQggr+fwyRi
	zxXl3i8/UPUgf0itV3JzFfptGa5i2KHWk+J1ho03DpDLLoyQRTjGuF6GXFK/NkpMY5wnRzL2fvD
	vwFDYKvVs7Q37JiIJVCvvMWJGpjueS0uR8E93Zl4ZkT/B26uL2USD9Ju2IRkXu0fqeQAsp5B8hZ
	J8I14EmntdcNMlqoGalGcfcnOyoX8dLsj0IHowC
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id 956f58d0204a3-67df447c2b9mr2926901d50.75.1795505874985;
        Mon, 23 Nov 2026 23:37:54 -0800 (PST)
X-Received: by 2002:a05:690e:450d:10b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67df447c2b9mr2926857d50.75.1795505874551; Mon, 23 Nov 2026
 23:37:54 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-mmap_prepare-v1-0-c56aadfbab8a@kernel.org> <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
In-Reply-To: <20261105-late-2026-mmap_prepare-v1-11-c56aadfbab8a@kernel.org>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:37:43 +0100
X-Gm-Features: Aa3M54q5vxZ2pH5GHxV6_gcu1Tnc83EBXhtYw1pJ9H77Fl7U3CQoqAKpEumRrbk
Message-ID: <CAGgiveX=Z5gS7iJWBanyysVUStDRbgTnVktQwJySXw_-xL+sUA@mail.gmail.com>
Subject: Re: [PATCH 11/14] tee: convert shm mmap hook to mmap_prepare
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
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Jan Kara <jack@suse.com>,
        Paul Moore <paul@paul-moore.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfXyAZgavJwpxGD
 TkDGKetafrS2Gm3q76s4PBEhhvyoZpN6K+g28IJgnXUcfsdKf86DwVNgiraRz/Vz6S9F2mw6ejE
 c+9ji/6eXQdNVv+cJfEuyQdfCgarV30=
X-Proofpoint-ORIG-GUID: TZb3se0yDo1Zy_vtD39HYgugGaZEn0NP
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b053ed4 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=97S62Xg_vF6B0O42EdoA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMCBTYWx0ZWRfXwof5RS6+J2+v
 ydV2vLOz7spn203GeLN1rJDUNEJh3ZhEB5eEohNwlRhFn+9nn8F6ASDxAcYiLb8yjCwUGiKQ4d+
 I+vAZs1Ia1B0qfLpLOMVh2LEv8du0bBnvnbguT3h7fz9bF5G/cTv8bC8mw+fyCtUY8B0u4iCQRN
 IH618FPA5SmGT06B4NXcRRvKolJYxfPsU3/MF9do7xe5+gAqYfFkQjeISifyqv4G1QkC745gvfg
 epYsqrC17Atcye10SGbBT9U4JSpZadxaKyV0ct9YO57iMRO+8ji7VvNQl45+OtR3VkEalNwXFa3
 j79k0McPIvGJbFpcqaqo3kjoqtCDpl+zAfClnhX9p1wfIOhYzs0B+v8rMDhwHeyAgb31AetUemb
 UBHCXTMCy1ZV5TXCwJCZsm3d7hq6V6xuPU3idU0f6sYUy8TvoVLxJvffeM+5HVc/NIEooRPDA+/
 z0eO1pBAX8dHUqBbSZQ==
X-Proofpoint-GUID: TZb3se0yDo1Zy_vtD39HYgugGaZEn0NP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240030

On Thu, Nov 5, 2026 at 10:08=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook, using th=
e
> PFN remap mmap action to map the shared memory.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  drivers/tee/tee_shm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Jens Wiklander <jens.wiklander@oss.qualcomm.com>

Thanks,
Jens

>
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index daa4af1e089e..8fcbf0232aeb 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -567,10 +567,9 @@ static int tee_shm_fop_release(struct inode *inode, =
struct file *filp)
>         return 0;
>  }
>
> -static int tee_shm_fop_mmap(struct file *filp, struct vm_area_struct *vm=
a)
> +static int tee_shm_fop_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       struct tee_shm *shm =3D filp->private_data;
> -       size_t size =3D vma->vm_end - vma->vm_start;
> +       struct tee_shm *shm =3D desc->file->private_data;
>
>         /* Refuse sharing shared memory provided by application */
>         if (shm->flags & TEE_SHM_USER_MAPPED)
> @@ -580,17 +579,18 @@ static int tee_shm_fop_mmap(struct file *filp, stru=
ct vm_area_struct *vma)
>                 return -EINVAL;
>
>         /* check for overflowing the buffer's size */
> -       if (vma->vm_pgoff + vma_pages(vma) > shm->size >> PAGE_SHIFT)
> +       if (desc->pgoff + vma_desc_pages(desc) > shm->size >> PAGE_SHIFT)
>                 return -EINVAL;
>
> -       return remap_pfn_range(vma, vma->vm_start, shm->paddr >> PAGE_SHI=
FT,
> -                              size, vma->vm_page_prot);
> +       mmap_action_remap_full(desc, shm->paddr >> PAGE_SHIFT);
> +
> +       return 0;
>  }
>
>  static const struct file_operations tee_shm_fops =3D {
>         .owner =3D THIS_MODULE,
>         .release =3D tee_shm_fop_release,
> -       .mmap =3D tee_shm_fop_mmap,
> +       .mmap_prepare =3D tee_shm_fop_mmap_prepare,
>  };
>
>  /**
>
> --
> 2.56.0
>
