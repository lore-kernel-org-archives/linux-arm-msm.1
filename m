Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792963825;
	b=Pd8/NnxBUZNRYqV8yeG7VBTJBPKWky6zFfe/0UNyfEKYmRnmGXLfbI3dypOmPs43n0Pc
	 M0BDZpZR9ETq9GmVIN7F0BBdCXKlIIJYs/wjPU01sR9LgCuUaETWGcebPgAxwKrC53cWb
	 OVWlCBnelbU14O1SeyJuXRMKMFh2aRh9+sR5ioIlrCxnBuwK7xyoRKtffAjx8m8naHlPn
	 RCGdh7S2e61neIYC41wMcf/hcQF7h/P5n7ZHDGTq5VlMn9nUmoXEXL5By5Un4NKVP2AWD
	 9970tbXpTTnDJsdFaHnZMCa6WQRaaJij8aSME4omg6w6DqKs07UN8eGVWESezuBC/tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792963825;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xSo6YJyFeQ1zMbTyziwWYIcuPb7sycKW/4CokJbJ79A=;
	b=OgN9/ep91Hp1FEEZLILYbOILGYFbBq2HV4n+VUMh70mjjOSdjcXOA1R5Rd4gAth5J5uw
	 jgKciqgfTFepmMdwfinsPYpx4I53iJ/QFeWQQ2lg+SnuN3L2CYZvRr9gxxCL38Pb9WA0N
	 P0Ctekru79CHKYwrwrnxuQotjE7v6AxUgJNfNojqOqXD0qaY3t6XDGIJscr3e4q2ELJzR
	 /X3DwezMWnYa8IKcPRhL+SAW3n7eUtDjwXcaqK0a85+w4kjIJGd8BIoNo/4ZPSlcJOMlL
	 7ynkIh40sIzd5w+yUo8h0ahv6aIwkTUqFlcm1fyjwSDwmHYGi2VsdciqO+vamOT2O0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JZIdBnWy;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EFC606A322
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 21:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EFC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JZIdBnWy
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso355089366b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 14:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792963823; x=1793568623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSo6YJyFeQ1zMbTyziwWYIcuPb7sycKW/4CokJbJ79A=;
        b=JZIdBnWyoWNxwt0dJMClhHkij7U/cXI8BSQM3pCxVUOjKg5NdEIVx9wZf7hJIG//cY
         vRlT8JSCdS9ZVgqp1fmrr/6FQILnYuQR1v3KovBDPUN9nu7SwE2NGCiMfd5KRTjGudQH
         dxo1SpIygBmtfPsfwDxzaK80fWhWKQcQhZ/1ix3Zqou77fhKBHQCT2uv+5HxGUW2ULxg
         MOqQo1sJc2Gp4ZpUhTFGjsWObTH8safBwhtbtDvTGG9T8FOpG719OPd8znP8Ge8SM7LP
         +hvXvrupHKzBNXKVFE6OvpvnS/pKolFe5fM8MtseMOYdKDb7YSUiQBdmuzFUlwvWOFwg
         HDcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792963823; x=1793568623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSo6YJyFeQ1zMbTyziwWYIcuPb7sycKW/4CokJbJ79A=;
        b=ldfEXp4udq/9ybCP54or3dq7Tp+W151BKE+NgWodYTR143DE6L/kR35XcbTH/XN349
         B60jJWqd/9C4kUa0IkTDiGiJwraVrGAII6Ud/Hlsu/6rG/uoIMb1DcJ1tmO7GdWih7rw
         FrP+124d115ATMYDdzL6q2K3gZrYLkbqtaElk/BOFMAVPPj6B82325WRvlN4wQx2P15O
         MVKa6M5161zm6ZTFloQ2/3++DcGZq3yGwn8rjTSjVPlr4K94jvfusq5o+d+s7E4Irq+k
         xjRkVIQtwXGC9qOGpI0xFxRh+dSrKF9ia2Zy5KQHPtpgHxP7IamJqkd8pQMCxGxLhueB
         xnew==
X-Forwarded-Encrypted: i=1; AKwUvBwso6jVH0KhyLA8h+SI1FoRiZF9ys3Kf1nYszFnEAISCZR9KoljzZNIj+Jf4rKcDwBKZK1K9PsEVMSuTcLh@vger.kernel.org
X-Gm-Message-State: AFq9FYIYdPQLmnfElMHmaEBUmH5BYF+G1HDH/V1p7UQzdQcVZ6C96Hhu
	7K9BmPlZZ9RvAoZSsadLnZcMmtDOUOFiXwQCAQJUE9kMbV3e2MdRM/GF
X-Gm-Gg: AYBFou2QoJyzXLJ24sgetSAoJ3BpqnZAMEx0TtrUki/ONj253RHrr2lUasM4VPEbK7/
	0ApBvDzZv9wZzBQMsdKfzfWoBOqeEuWL7v9zIIW0LNt7KuPbg4ALSm730xUz+FUKwBa9XE0GnOX
	XZvynJT98USKVGoVu37++FwjFkTrPP1u3XCKUQt4FyNI4Ue7jE25S9o1XbEl1EMqAeQEO/PppeX
	bDVSZTejjNKedNUZVOF/f+OdDHJCzBSWOWRdeY+OpvPsY85lpvOqyzIWKFFB44UCS6pCsUgbLOo
	4B9udfBPXosONmb4M3QXJIO+fgvajkr7y8b8JK1IkXB6lLM+GofaKmFS4R0XCWvVGHM7gdHjzsz
	IFVaDoFay9/sq/p9+8yIrge5EJdQVz/iVJKZCn8MgwinLyclFMyTSpMr0IUwunFMRitdrPfctAv
	50YnH35SxR0I9OWSKbpa4QSelyC3RekHZLB1qJK/oJvz7vAkMuAUHNTWN2vKjbAfqdOXwRZC+1D
	Mkc/gDx6YWr+59TKhelLIIUUFU15B8b0sV0D1WHsDw8ulCWNIK+zGYLloDIhFQ=
X-Received: by 2002:a17:907:2d92:b0:c40:f9ea:7375 with SMTP id a640c23a62f3a-c46bddaed7cmr675175366b.15.1792963822908;
        Sun, 25 Oct 2026 14:30:22 -0700 (PDT)
Received: from nb-xps.ts.zxczxc.org ([78.56.243.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79eb05sm244744266b.79.2026.10.25.14.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 14:30:22 -0700 (PDT)
From: Nikolay Bryskin <nbryskin@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-bluetooth@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Rocky Liao <quic_rjliao@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Reprobe QCA6390 after hibernation
Date: Sun, 25 Oct 2026 23:30:13 +0200
Message-ID: <20261025213013.12956-1-nbryskin@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atXiYxot6UZ3MDrp@makrotopia.org>
References: <20261017174310.22484-1-nbryskin@gmail.com> <atXiYxot6UZ3MDrp@makrotopia.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Daniel,

On Mon, Oct 19, 2026 at 09:30:06AM +0000, Daniel Golle wrote:
> Would you be fine basing your patch on it once it has landed?

Yes, thanks for the review. I'll send v2 on top of
device_schedule_reprobe() once it has landed, with qca_restore() as
you suggest.

I tried the combination in the meantime: v4 1/4 plus hci_qca converted
as above, on 7.2.11 on a Dell XPS 13 9310 (QCA6390 on UART, no BT_EN
GPIO). After resume from hibernation the reprobe ran, the firmware was
downloaded again and Bluetooth worked; s2idle suspend did not trigger
a reprobe. I've replied to 1/4 with a Tested-by.

Nikolay
