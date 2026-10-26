Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007018;
	b=AEms4ADLyMeHi7NKen+KmIkT6PVfu2cx2xfIA3i0xeuZIhId4w/tyV6yiMUPUSgnFEMW
	 DbG66Fy5KNLdMaWmD0Pu8BrhAQzAKMbVmfms8PrwWCQag/8BHV3N/QSqvrg/oDdOdrVcQ
	 7wVA5W7SwMh7JGesjCHmoULOZHerzDsx8PhMEffjYRwqEdG62Ge5/+CVvxhoEkkrjWgO5
	 FScvKTGlNZBZ4cL1Ll4ROJK2fyciaZ1PrYgHlBkN7mMou3xYUnAsNXLxL5AyE+edr7mSB
	 /XDUt1IH1ZwH3cdJhEggL/1uLoJRcLioIzAjntCd7OsfxvFAID+9InpGGCNH7cuzwTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=;
	b=ef4YCOAoSf7VipowCs7fu8ujiLJHGUrjScgF4pTQ10Ws7q/BeydYTF+fJ2zuKRiJX+Lm
	 XArviYebw1/oXDXng25zfM03OK/xuM5zeg62FDBkDvuw8CXD1HgzMdvi7lFmtAcMYZE+x
	 kdIPE0PzHnKngPO9SFMSzWKDyXOvqdknHSjrs4VGi0JzJng+xY1odBfp5+Vvv3RNP7Uhn
	 KOpm4wE3xXf1RdvSHjXJv350U6H4mBZKss1flwiyoik8pVXshJst8TiOO+o/nRz0IDCG0
	 T4gDkT0mKGTAVQv5L+9xDIF+wOP9HWhrmHRbNlMisf28QtUKg1eQh3o5GDc2e5fmmPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMuC6mMG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9pQbz2C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA4606A323
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BA4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OMuC6mMG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9pQbz2C
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSYF1708628
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=; b=OMuC6mMGZ/5wxg4a
	iTRvasDq9tw2WzKpZwL8FKWExYiDgDrxkkB1QTQkiym0z/u3voPeDBVyU+pBgG9v
	1hLEMhrgG64Z6Qvif2hf2FxYkm7TYEbb8ezRZBABF9ax9y1ZZ+i+LCfuChBdmmcI
	UyG0OL+Zmf6SXBlOzeflnUWLkWN3Ca18v+ylo4htEA2zes65XwLwMUaBa0onnT1y
	iPbzbLNg5Vev2XTe68GuDNt+UfRJZTKgmT0gbMlsHF76wTLUqntzoOEuHQ/mJsyL
	jm/rMStB4JlyYH7JTP4rmlDhY4i5t9WDg+4o+XXoA/KI7VnGVHIOMhFqK3muLOkZ
	Ustdxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9s1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:30:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so44042285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007016; x=1793611816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=;
        b=b9pQbz2CRhEjCDMGFVw7i1MEx29g423bXRpJFNYA4J+jclhRWCFgM6lkOkNZZRMNYx
         KjTZu5wFzsTSQ1F2hugTCq+TmxDNg62WPscnvMsHuDN7kHCZAvcw8qUDxgqa9Tvz1gfR
         3NFiTX60SDlDnx+W+T1IrYCH6CWIWk61z4mJVUHhju+6ed77ut8BM7DtPlE1BOq6wevg
         DFHQTkrPn1nCjIyGKEtofDZDgdZsXGHiFG4RGu6R7EuMCQxawkRfPTomuKDxLnYodW8/
         HFj85TDAimTkvwwBv3rnbZQ2Qn0V6qsZBf24FmQqX7oLjfbG2JGFi4iejoJWHyqYy8aG
         Fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007016; x=1793611816;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mIZQSiSpM/e7488u2Fdp6mOIGOxn9HRZ2vmfwI5LSlk=;
        b=XTVaXGwVO76iMc5fEv/EOFKiN3Cow7A1FkbDeiClryI2ySlH/N3bbwexgohPq6QEV6
         P/Zpx/S8H2TcV/zxk2daT0UpLWLnHES3BoiTdeNTLUYZDv1rd7kRdbPdO+dvDtJK3dmf
         42MHNZJUiVBpQoakkHg0pR1CthfiXAQ9kNk3LPspSMIAoYu8HKmx9QboPWSBuVPX50UW
         FDFMH78wR9CV2ihn468yZbB6e9JunUsTRuxmhYdLof7eBXpE2SCKJFYNfyEItKuo2BNw
         7Qw62T0noAWuVUryjHfRg2993OQ0yWYEkqnejeqoaZ2sVKTfWWBHEzBP43tsPwc68eI2
         08ew==
X-Gm-Message-State: AFq9FYKPHzvvtBaoaLWB2hV4kuF+Xght/IxylSEujskx+4Q+UMP6aDUw
	soP8Y9D+neR5GKINrEeihbAQKAZXkURv9tz3xYQZOjEaM96cGYIOi3Yrlakc3jeCU9LVz1uQPyy
	lgQHLq5Ui5im5PZqUZBDaUja3X57YN/i5YW7ukJzMFfdlF2hUrYUXNXEtSqbBBjyJo17I
X-Gm-Gg: AYBFou2vVuSm1wSQaeU6PCKY5stPXUObysW/Ms54jvPUqolcN/xN+iDxNxe1UTuM0lN
	2OsQZBulgpqMmn3DSq2H4sl/WqFXVDEEdyYu9j+9pa5LktuPTqiUV2Tqhl3mel7NdWDOQKYMRFz
	4eao7eLys6IVAhihrzdOYnBIn8UpmbYEzcKhBZ3a28PopRz0MmUcRw93izFyBWE1pOe9cREm2Fw
	nKsku0q0CU69/JZ9hRqkPdGIK7VTzGxZI74lp+7G+EK0nUvwrU2DfqyxGA5bGF1ideJ21w0zWqz
	j/kQdxJcuvSugFCJD5q4X3ISZkPBYfFUY/1EI/JubTYKkCssSzt0MSawKHxqYoT/LdIj0Ofy2nB
	hKbYGE8/4xBeNPKswPyRhpQ==
X-Received: by 2002:a05:620a:3a46:b0:939:8bc:8826 with SMTP id af79cd13be357-940ef81ea60mr928440785a.2.1793007016448;
        Mon, 26 Oct 2026 02:30:16 -0700 (PDT)
X-Received: by 2002:a05:620a:3a46:b0:939:8bc:8826 with SMTP id af79cd13be357-940ef81ea60mr928437485a.2.1793007015951;
        Mon, 26 Oct 2026 02:30:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4998f79fcfsm40784166b.39.2026.10.26.02.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:30:14 -0700 (PDT)
Message-ID: <b3a3e3fc-1cfd-46e5-8474-e74b9b331075@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:30:12 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/14] drm/msm: clean up after a failed msm_kms_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-5-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-5-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l2tQyUzGfKXZ3J6mSO16zdStGTF_Y5TX
X-Proofpoint-GUID: l2tQyUzGfKXZ3J6mSO16zdStGTF_Y5TX
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf1da9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aNtMi0Rn-IhE4xeoyWcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXw9OhNJZvlZnn
 DwaU1BJTY7OxIy/EZWQR9vWRlKkzmwq1TEwnu08B7LuKEck1zmlUJRvU+sHWW/CC7s5duH+5I8i
 Ut8ON0rUBhK/dV2evFNbF2ZJiLSoWtc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX1wqSKmjGDNQf
 3Elg5A41186EAh2lwWi97ZuIq7hpm2vwUIBvGeLYGl5JZmyX3SB+A+jM3N889vPywhBs9h8Ulrs
 kzHuQhoTvWdq4IdS2SV4paupPhn03LWISML/Te4aAbT84DACHJocXdFicMOc7BM2gloSSoXmNyM
 ki2TV0SdwAKVUtURXI2C1trtyqBBaHeL1JdnUHI5c6AtHvrYK7Iu3Rs6L1/ALiarEjAJFWUskxA
 +ZVBTYWhtbjF427lvZ7FaZYS6IaGb05CyAz6djCcgKB55sLjOk09ittyvUQqYo/tkQwOdaHKLzv
 73v2YYZ0yVuyW3RPaJPr+MOj0d7yVaCrj5O7TosvwX1ugAOBaevLhVWJeRd68FzyLug5AlWLRn0
 W+uvoq6FTzm/Lb5eQ0ODRx3yq/Uf8X76JfC+nBf6n/DtThRMrdRcUgnV5eGYIylQlCPHu3cRCHO
 0cq8aXoaC/wiK6ufwVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> msm_kms_init() returns early when it fails to allocate its workqueue or
> to create one of the pending timer workers, leaving behind whatever it
> has already set up. The kms drivers' ->destroy() callbacks still run in
> that case and reach msm_kms_destroy(), which passes a workqueue that was
> never allocated straight to destroy_workqueue().
> 
> Tear down the timers and the workqueue created so far when
> msm_kms_init() fails. Until every kms driver has stopped relying on
> ->destroy() to clean up a failed init, let msm_kms_destroy() skip what
> has already been destroyed.
> 
> Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
