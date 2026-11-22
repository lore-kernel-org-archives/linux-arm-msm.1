Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341833;
	b=3j9zSpPY2Q13DgVku1azfrquBCDbnUnE6TyFcUdkgJJEFbdqW3GBinklp+tQEwDDM+AB
	 5ZsIsYc0+G4BGDh16exfl8H2TKR+ixhZaYoDM9/djHwcs51LXV2hVg7OPOChuxnTSwO2e
	 r4OKRFhD66TCHn7uVinmPtRfIC6apdPTx+ZPQkCywo5z2elOtAKLjkleS5NGuCObd5h/k
	 DGTJaPFOJcBxNkRRSLYCBYq2IgZEVsZT3eVqZK6ds5SpMBJ9QP1ogedwOfEzpAD4vWNNE
	 0fpRgVjq6AhHNi30pTLMsdYyJIoO912Q8GdChph+KBPQeYDftaLqy0fHg+FRLEcb+LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
	b=AwW7Qv/Cwt51MPrxAv6wW9TiDVUy75KuBjPr0yCL0o+NvxU+7jD7NVVBGstH4q6v8+rd
	 tx4NgX4yXq2meRLDae4ONelnCEwgeKHDKATXJHeBtmqih253drGC/S/o1fydXXnx1XOe6
	 zQSX5XmfGBwrRtrJL63OOyui5/CB97Ts0et7Y3Xl++BJp9cxqtjdr/dgHJzg2VMrs/1pO
	 Ar/FDbv7ylFVA3zcZgMggEUXAPcv47Yn+L+4Zuolt60mQ5zybv68lSc980BA0d+WgW7Sk
	 qQfKhAJZ/bKzrZaVjLNlWA9r6XXa+b/E24VTyzQt28FcUkF56D90GLdm2vqQugPPqyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRMIX9Fs;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BFD606A32C
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6BFD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qRMIX9Fs
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab30d04674so3030031fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 02:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795341831; x=1795946631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
        b=qRMIX9Fse1q9rgE+hsN3rqYn28MkIBOjp9Z1P3GlJ19eu6CSdU3bVhVg+riMplID2T
         MsrzKHjY9yAuyeunBzQ0iuNLRKSre/z6fBX1yifAL/HhgIR1cY7a6bt9IU9jrblmZdXa
         jTOAXe+Xnq+myUzRIx0cehqNFRZBS9Fkb7kZwuSaBLcWqUBuuO1oT45RdJlnhg4gPNvL
         V0PTHgEYpK7sTjiLPa9zpxf1e0v0EvE9zeQUrTaBOMPArIe7mIOJYYOPgcDvUtD5old+
         jv9fkGTv5TLsrGx3eXDM34K35gy7GFnlTJjfQwv4Rcv+Qw0dj2avsHWLDIMEuEMBEbhX
         eGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341831; x=1795946631;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kx+CcY0AoSPVkezXa3vLWUzHo20k6i0oHhJXWDP3uek=;
        b=iCkzZHAPOY3BW4n9p/csAt6pbeX1pNugQTVMeBTWNgS1GlORJlO6B4Q4BqQ8O73FGP
         XsEqNfPqPvi63AH+c/ZV2wIQKhWhoQrjSmOEFpDHzwWU/4Nv9T0YS+c1QZOTKcOrCAyP
         bmUcmsMsbAiMu7YGufzfWgiIratdEqKd1oKHP6b2HHe1299ekdU3sTENBtQ5qmlEtBKI
         PgEqrXUl1LctF9NNbhqqbbfaAwF+z+1eleWLPwc+ZTZ4tVNGWsQZfUGXkgPPCajZc3yh
         MM9FSlrg8/xHt6GjZATWIoBh7J9yijabE7dGR4gysqD06WMehDJTF/soE9fIQHZyzaJl
         r0NQ==
X-Forwarded-Encrypted: i=1; AL+hErHBo2EATGx8TShXiw1iLYlm5U0ttyhdBguf7DLkGrdPMnr2Kaxfk3cfeNMGKUYdntE81cdh3dBfBjRZUwcq@vger.kernel.org
X-Gm-Message-State: APuU4Z88RI0AECghdiAMsRbkuYJKu5eJiu09CMCOUjgfbku58KIuaEhz
	RM+snohiHBWH/geMJHC5/Bdp+da5kpDP/y38k2y8Z/ELcr1Yvwl/jhcp
X-Gm-Gg: AZFdTZe1IBT8S5FENYDmDhvQHE8OGjiOngrCAjIvqsN9JGzsf1gR039mNjd/ENFsy4M
	8IjGASM2nIqn2+w38LxcozZk7R091C7QSWy0zK1aYml46BSF2UO+JhAIav9EZLrt+9bQTEu8bcO
	5+TQo1DhzDT/UGyCdFGq2r+LWfRG+WuosNwieGnvmYJ+9q6xylcSivtEH/EqGRRQs1gwisAslrj
	5sve3wVygYuN1/zr88qQ+IiB7wsNcK6yWWWEozjcqol2Jr7oC9+oDL0k8iTWm1VFxQVQwLNibnR
	ILxT5vgZkEOzqsI5HHRcZfXxww6fVv5vcTw64hM0/rPwoFOj8mFr7fK7UDxyo6ZoojSFIUKVuaf
	qKRj7PykLnbZPlI+fUvJxxB3ksFN26MkYy82t0eHQ1NymwZhI85QVuiVuMJnQUKmHdLLjeOwHvQ
	z+ZtPW6340s1GgtvGA8wF7ywHAYTaSQ3i6RQdtarbrBdsgQWA1rSHa7AM+Y+wr6uZYVG8PgHfhv
	FTvVtItGRjJvR4EOX+enYTXvhRodvR6PW16RAEVNbH2GMBW7lnm5+wTlPwIKV9RyTOUaKKoSwAg
	d3AvlnVa0NDx5TAXo79W/WC/4cx7p5Q0slMzSkInvHLG4ASdevUjT3JDvhYp0MHvDTNyOOGyGBI
	vKZzL/oyqcXUd74AsoRmxv6HL6vEOU7gKK0rLaZl4
X-Received: by 2002:a05:6512:12c7:b0:5bf:a48b:7827 with SMTP id 2adb3069b0e04-5c1bc6bf385mr2679661e87.2.1795341830712;
        Sun, 22 Nov 2026 02:03:50 -0800 (PST)
Received: from localhost ([178.150.68.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ee97csm23390751fa.13.2026.11.22.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 02:03:49 -0800 (PST)
Date: Sun, 22 Nov 2026 12:03:48 +0200
From: Ivan Verbovoy <ivanverbovoy@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: enable CPU interrupts only for MMIO controllers
In-Reply-To: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
References: <20261109-swrm-mmio-irq-v1-1-570fc05f22d7@gmail.com>
Message-ID: <20261122-swrm-mmio-irq-ping-f2926d22952d@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Vinod,

A gentle ping on this one. It fixes a regression from b27be5a85ed3,
which is in v7.4-rc1, so it would be good to have it in the fixes
for 7.4.

Thanks,
Ivan
